module Ghbase
	module Http
		module Constants
			BASE_URL = 'https://bigtableadmin.googleapis.com'.freeze

			# Table URLs
			CREATE_TABLE = '/v2/projects/:project_id/instances/:instance_id/tables'.freeze
			LIST_TABLES = '/v2/projects/:project_id/instances/:instance_id/tables'.freeze
			DELETE_TABLE = '/v2/projects/:project_id/instances/:instance_id/tables/:table_id'.freeze

			# Operation URLs
			LIST_OPERATIONS = '/v2/operations/projects/:project_id/operations'.freeze
		end
	end
end