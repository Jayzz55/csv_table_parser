class TableParser
  module Adapter
    class Split
      class << self
        def parse(text)
          delimiter = / *, */
          lines = text.split(/\n/).map(&:strip)
          keys = lines.shift.split(delimiter, -1)

          rows = lines.map do |line|
            row = {}
            fields = line.split(delimiter, -1)
            keys.each { |key| row[key] = fields.shift }
            row
          end

          return rows
        end
      end
    end
  end
end

