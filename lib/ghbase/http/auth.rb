require 'googleauth'
require 'googleauth/stores/file_token_store'

module Ghbase
	module Http
		module Auth
			attr_accessor :access_token, :token_type, :expires_in

			SCOPES = ['https://www.googleapis.com/auth/bigtable.admin'].freeze

			# Authorize using .json credentials
			def authorize
				authorizer = Google::Auth::ServiceAccountCredentials.make_creds(json_key_io: File.open(json_key_io), scope: SCOPES)
				token = authorizer.fetch_access_token!
				token.map { |t,v| send("#{t}=", v) } # set access_token, token_type, and expires_in variables
			end
		end
	end
end