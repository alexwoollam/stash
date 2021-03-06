require 'dotenv'
Dotenv.load

set :stage, :staging

$user = ENV['STAGING_USER']
$path= ENV['STAGING_PATH']
server ENV['STAGING_SERVER'], user: $user, roles: %w{web app db}

set :deploy_to, -> { "/home/#$user/subdomains/#$path" }
set :tmp_dir, "/home/#$user/tmp"
set :branch, :'develop'
set :wpcli_backup_db, true

set :wpcli_remote_url, ENV['ENV_STAGING'].gsub("http://", "").gsub("https://", "")
set :wpcli_local_url, ENV['ENV_DEVELOPMENT'].gsub("http://", "").gsub("https://", "")

fetch(:default_env).merge!(wp_env: :staging)