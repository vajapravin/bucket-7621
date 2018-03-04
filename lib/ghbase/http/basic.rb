require_relative './auth'
require_relative './constants'

module Ghbase
	module Http
		module Basic
			include Auth, Constants

			# GOOGLE ProjectID and InstaceID
      attr_accessor :project_id, :instance_id

			# request variables
			attr_accessor :json_key_io, :client, :headers

			# response variables
      attr_accessor :status, :body, :response

      # initialize client
			def client
				authorize unless access_token # authenticate using `authorize` method exists in ghbase/http/auth.rb
				@client ||= HTTPClient.new(base_url: BASE_URL, default_header: headers)
			end

			# set header 'Authorization: Bearer ya29cElp0BVrO0g7....'
			def headers
				@headers ||= { 'Authorization' => [token_type, access_token].join(' ') }
			end

			# GET request
			def get(url, options)
				safe_request {
					@response = client.send("get", url, options)
					@status = @response.status_code
					@body = JSON.parse(@response.body)
				}
			end

			# POST request
			def post(url, options)
				safe_request {
					@response = client.send("post", url, options)
					@status = @response.status_code
					@body = JSON.parse(@response.body)
				}
			end

			# PUT request
			def put(url, options)
				safe_request {
					@response = client.send("put", url, options)
					@status = @response.status_code
					@body = JSON.parse(@response.body)
				}
			end

			# DELETE request
			def delete(url, options)
				safe_request {
					@response = client.send("delete", url, options)
					@status = @response.status_code
					@body = JSON.parse(@response.body)
				}
			end

			private

			# Thread request call
			def safe_request &block
				threads = []
				threads << Thread.new do
					yield
				end
				threads.map(&:join)
			end
		end
	end
end