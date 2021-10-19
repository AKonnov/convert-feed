# frozen_string_literal: true

require 'nokogiri'

# Parsed rss to Dto
class RssParser
  def self.can_parse?(data)
    data = Nokogiri::XML(data)
    !data.xpath('/rss').empty? || !data.xpath('/rdf').empty?
  rescue Nokogiri::XML::XPath::SyntaxError
    false
  end

  def parse(_data)
    raise NotImplementedError, 'Need implement'
  end
end
