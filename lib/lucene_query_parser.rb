require "lucene_query_parser/version"

require "parslet"

module LuceneQueryParser
  # Your code goes here...

  require "lucene_query_parser/parser"
  require "lucene_query_parser/transformer"

  def self.parse(str)

    parser = Parser.new
    transformer = Transform.new

    tree = parser.parse(str)
    transformer.apply(tree)
  end


end
