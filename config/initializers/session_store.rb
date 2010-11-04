# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_highcharts-rails-test_session',
  :secret      => 'cd35ec373139aea74df700963bb0db482a44132632a8da5218082256f5c913b5030713d78d7559664262389ff011383ee88ec156959cf9c3b25b7a3381982a56'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
