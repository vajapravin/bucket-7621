require_relative '../http/constants'

module Ghbase
  module Orm
    module Common

      include Ghbase::Http::Constants

      private

      def make_request(args, req_type)
        url = endpoint(caller_locations(1,1)[0].label)
        send(req_type, url, parameterize(args))
      end

      def custom_request(args, url, req_type)
        send(req_type, url, parameterize(args))
      end

      def endpoint(label)
        url = eval(label.upcase).dup
        url.gsub!(/:project_id/, project_id)
        url.gsub!(/:instance_id/, instance_id)
        url
      end

      def parameterize params
        uri = Addressable::URI.new
        uri.query_values = params
        uri.query
      end
    end
  end
end