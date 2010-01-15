# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_autwatch_session',
  :secret      => 'ba0924da2e896602f9047d9c34a0e2bd6ebd1ef3dc2c9ed225fe2c42173f8ddd730ff69ffeeb1edcac52530a61177496d0bfce363b72501da11f1dcf5e348df2'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
