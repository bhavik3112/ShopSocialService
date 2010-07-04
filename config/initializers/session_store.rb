# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ShopSocialService_session',
  :secret      => '2f8469dee865808b9ed394896bc74ff49f7589e924c7decc485327473620969a56bcbfb60a82267206e9e58aaf69118e18763e3ba2d5dc670dd13b4cf16d0421'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
