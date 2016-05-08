require "table_parser_test"

class TableParser::ScanAdapterTest < Minitest::Test
  include TableParserTest

  def setup
    TableParser.new(adapter_type: :scan)
  end
end
