# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_chester_session',
  :secret      => '933aceffa412ca597dc1bee034c6ee0b19dc347689a981a11a85200975809f171590d9919ff0a8cb8677bae2138325a9204066f879cb20bbbed6d5575e3a7fda'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
