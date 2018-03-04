require './lib/ghbase/ghbase'

class Hello
	def initialize
		table = Ghbase::Orm::Table.new(ENV['GOOGLE_PROJECT_ID'], ENV['GOOGLE_INSTANCE_ID'], ENV['GOOGLE_JSON_CREDENTIALS'])
		print table.create_table({"tableId":"HellowWorld"})
		print table.list_tables
		print table.delete_table('HellowWorld')
	end
end

h = Hello.new