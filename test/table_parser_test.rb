require "test_helper"

module TableParserTest
  def test_parse_columns_and_rows
    text = <<-TEXT
      Name,LastName
      John,Doe
      Jane,Doe
    TEXT

    john, jane = TableParser.new.parse(text)

    assert_equal "John", john["Name"]
    assert_equal "Jane", jane["Name"]

    assert_equal "Doe", john["LastName"]
    assert_equal "Doe", jane["LastName"]
  end

  def test_empty
    text = <<-TEXT
      Name,LastName
    TEXT

    result = TableParser.new.parse(text)

    assert_equal [], result
  end

  def test_removes_leading_and_trailing_whitespace
    text = <<-TEXT
      ,  Name,LastName
      ,John    ,  Doe
      ,     Jane,       Doe
    TEXT

    john, jane = TableParser.new.parse(text)

    assert_equal "John", john["Name"]
    assert_equal "Jane", jane["Name"]

    assert_equal "Doe", john["LastName"]
    assert_equal "Doe", jane["LastName"]
  end
end
