# frozen_string_literal: true

require 'nokogiri'
require 'date'

# Parsed rss to Dto
class RssParser
  def self.can_parse?(data)
    data = Nokogiri::XML(data)
    !data.xpath('/rss').empty? || !data.xpath('/rdf').empty?
  rescue Nokogiri::XML::XPath::SyntaxError
    false
  end

  def parse(data)
    @input_feed = Nokogiri::XML(data)
    items = []
    @input_feed.xpath('//item').each { |item| items.push(parse_item(item)) }
    last = items.max_by(&:published_date)
    result = parse_root(last ? last.update_date : nil)
    items.each { |i| result.add_item i }
    result
  end

  def parse_root(updated_date)
    FeedDto.new(
      @input_feed.xpath('//link').first.content,
      @input_feed.xpath('//title').first.content,
      @input_feed.xpath('//description').first.content,
      updated_date
    )
  end

  def parse_item(item_data)
    link = item_data.search('link').text
    date = parse_date(item_data.search('pubDate').text)
    FeedItemDto.new({
                      id: link,
                      title: item_data.search('title').text,
                      link: link,
                      description: item_data.search('description').text,
                      published_date: date,
                      updated: date,
                      author: parse_author
                    })
  end

  def parse_date(date_str)
    DateTime.parse(date_str.to_s).to_s
  end

  def parse_author
    {
      name: @input_feed.xpath('//webMaster').first.content,
      uri: @input_feed.xpath('//link').first.content,
      email: @input_feed.xpath('//webMaster').first.content
    }
  end
end
