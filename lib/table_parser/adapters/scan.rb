class TableParser
  module Adapter
    class Scan
      class << self
        def parse(text)
          delimiter = /[^,]+|,,/
          lines = text.split(/\n/).map(&:strip)

          keys = lines.shift.scan(delimiter).map { |key| key.strip }

          rows = lines.map do |line|
            row = {}
            fields = line.scan(delimiter)
            keys.each do |key|
              row[key] = fields.shift.strip
              row[key] = "" if row[key] == ",,"
            end
            row
          end

          return rows
        end
      end
    end
  end
end
