require 'hbase'
require 'awesome_print'
require './lib/operations/row'
require './lib/operations/scanner'
require './lib/operations/table'

class HelloWorld

  include Operations::Table, Operations::Row, Operations::Scanner

  attr_accessor :client, :table, :column_family, :rows, :scanner

  def initialize url, table, column_family, rows = ["Hello World!", "Hello Cloud Bigtable!", "Hello HBase!"]
    @client = HBase::Client.new(url)
    @table = table
    @column_family = column_family
    @rows = rows
  end

  def call
    ap "Create table: #{table}"
    create_table(table, column_family)

    ap "Create some rows"
    rows.map { |r| create_row(r) }

    ap "Scanner Operation"
    @scanner = open_scanner
    get_rows.map { |r| ap r }
    close_scanner
  end

end

HelloWorld.new('http://localhost:60010/api', 'users', 'hello').call