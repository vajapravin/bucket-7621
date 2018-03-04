require_relative '../http/basic'
require 'pry'

module Ghbase
  module Orm
    class Operation
      include Ghbase::Http::Basic, Common

      def initialize(project, instance, json_file)
        @project_id = project
        @instance_id = instance
        @json_key_io = json_file
      end

      def list_operations(payload)
        make_request(payload, 'get')
        [status, body]
      end
    end
  end
end