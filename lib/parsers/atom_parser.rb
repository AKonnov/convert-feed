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

  def parse(data)
    data = Nokogiri::XML(data)
    result = parse_root(data)
    data.xpath('//xmlns:entry').each { |item| result.add_item(parse_item(item)) }
    result
  end

  private

  def parse_root(data)
    FeedDto.new(
      data.xpath('//xmlns:id').first.content,
      data.xpath('//xmlns:title').first.content,
      data.xpath('//xmlns:subtitle').first.content,
      data.xpath('//xmlns:updated').first.content
    )
  end

  def parse_item(data)
    object_data = {
      id: data.search('id').text,
      title: data.search('title').text,
      link: data.search('link').attr('href').to_s,
      description: data.search('summary').text,
      published_date: data.search('published').text,
      updated: data.search('updated').text.to_s
    }
    FeedItemDto.new(object_data)
  end
end
