require_relative '../http/basic'
require_relative './common'

module Ghbase
  module Orm
    class Table
      include Ghbase::Http::Basic, Common

      def initialize(project, instance, json_file)
        @project_id = project
        @instance_id = instance
        @json_key_io = json_file
      end

      # create a table whose column_family is habbit
      def create_table(payload)
        make_request(payload, 'post')
        [status, body]
      end

      # list tables
      def list_tables
        make_request({}, 'get')
        [status, body]
      end

      # delete table
      def delete_table(table_id)
        url = endpoint("delete_table")
        url.gsub!(/:table_id/, table_id)
        custom_request({}, url, 'delete')
        [status, body]
      end
    end
  end
end