require 'http/auth'
require 'http/basic'

module Ghbase
	class Client
		include Auth, Basic
	end
end