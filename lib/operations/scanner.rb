module Operations
  module Scanner
    def open_scanner
      ap "Opening scanner"
      client.open_scanner(table, "#{column_family}:")
    end

    def get_rows
      ap "Getting rows"
      client.get_rows(scanner)
    end

    def close_scanner
      ap "Closing scanner"
      client.close_scanner(scanner)
    end
  end
end