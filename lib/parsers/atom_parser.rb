# frozen_string_literal: true

require 'nokogiri'

# Parsed atom to Dto
class AtomParser
  def self.can_parse?(data)
    data = Nokogiri::XML(data)
    !data.xpath('//xmlns:feed').empty?
  rescue Nokogiri::XML::XPath::SyntaxError
    false
  end

  def parse(_data)
    raise NotImplementedError, 'Need implement'
  end
end
