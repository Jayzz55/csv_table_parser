class TableParser
  attr_accessor :adapter_type

  def initialize(adapter_type: :split)
    @adapter_type = adapter_type
  end

  def parse(text)
    adapter.parse(text.strip)
  end

  def adapter
    require_relative "table_parser/adapters/#{adapter_type}"
    TableParser::Adapter.const_get(adapter_type.to_s.capitalize)
  end
end
