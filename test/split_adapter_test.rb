require "table_parser_test"

class TableParser::SplitAdapterTest < Minitest::Test
  include TableParserTest

  def setup
    TableParser.new(adapter_type: :split)
  end
end
