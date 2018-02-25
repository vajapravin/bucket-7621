module Operations

  module Table

    # list tables
    def list_tables
      client.list_tables
    end

    # create a table whose column_family is habbit
    def create_table(table, column_family)
      client.create_table(table, column_family)
    end

    # list available tables
    def show_table(table)
      client.show_table(table)
    end

    # disable table
    def disable_table(table)
      client.disable_table(table)
    end

    # enable table
    def enable_table(table)
      client.enable_table(table)
    end

    # delete table
    def delete_table(table)
      client.delete_table(table)
    end
  end

end