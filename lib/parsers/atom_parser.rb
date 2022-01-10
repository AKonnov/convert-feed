# frozen_string_literal: true

require 'nokogiri'
require_relative '../dto/feed_dto'
require_relative '../dto/feed_item_dto'

# Parsed atom to Dto
class AtomParser
  def self.can_parse?(data)
    data = Nokogiri::XML(data)
    !data.xpath('//xmlns:feed').empty?
  rescue Nokogiri::XML::XPath::SyntaxError
    false
  end

  def parse(data)
    @input_feed = Nokogiri::XML(data)
    result = parse_root
    @input_feed.xpath('//xmlns:entry').each { |item| result.add_item(parse_item(item)) }
    result
  end

  private

  def parse_root
    FeedDto.new(
      @input_feed.xpath('//xmlns:id').first.content,
      @input_feed.xpath('//xmlns:title').first.content,
      @input_feed.xpath('//xmlns:subtitle').first.content,
      @input_feed.xpath('//xmlns:updated').first.content
    )
  end

  def parse_item(item_data)
    object_data = {
      id: item_data.search('id').text,
      title: item_data.search('title').text,
      link: item_data.search('link').attr('href').to_s,
      description: item_data.search('summary').text,
      published_date: item_data.search('published').text,
      updated: item_data.search('updated').text.to_s,
      author: parse_author(item_data)
    }
    FeedItemDto.new(object_data)
  end

  def parse_author(item_data)
    {
      name: item_data.search('author//name').text,
      uri: item_data.search('author//uri').text,
      email: item_data.search('author//email').text
    }
  end
end
