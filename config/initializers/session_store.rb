# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_piracy_session',
  :secret      => '06aeb6f4f36a406f9bff59cfff3fd8c7293239c5151e30593f69b1d813ac76937f4c0f370c4ffedbe6b36c1f59e5aa76a2cfc56c690f02b6c6d64f9398e286c9'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
