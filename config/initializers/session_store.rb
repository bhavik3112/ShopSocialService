# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_shopsocial_session',
  :secret      => '9b3659b89b7719f0d0697807d77495c786e933c3e4ec46797cac970310595acdf56e4c73998f3a2ebac1acaef9a3fce7523c236dff6e65971d7c3d3cdba1536e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
