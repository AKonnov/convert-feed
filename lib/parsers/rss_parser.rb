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
    data = Nokogiri::XML(data)
    items = []
    data.xpath('//item').each { |item| items.push(parse_item(item)) }
    last = items.max_by(&:published_date)
    result = parse_root(data, last ? last.update_date : nil)
    items.each { |i| result.add_item i }
    result
  end

  def parse_root(data, updated_date)
    FeedDto.new(
      data.xpath('//link').first.content,
      data.xpath('//title').first.content,
      data.xpath('//description').first.content,
      updated_date
    )
  end

  def parse_item(data)
    link = data.search('link').text
    date = parse_date(data.search('pubDate').text)
    FeedItemDto.new({
                      id: link,
                      title: data.search('title').text,
                      link: link,
                      description: data.search('description').text,
                      published_date: date,
                      updated: date
                    })
  end

  def parse_date(date_str)
    DateTime.parse(date_str.to_s).to_s
  end
end
