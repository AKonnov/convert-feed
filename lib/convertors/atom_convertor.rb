# frozen_string_literal: true

require 'nokogiri'

# Convert data to Atom format
class AtomConvertor
  def self.can_convert?(type)
    type.to_s.downcase == 'atom'
  end

  def convert(feed_dto)
    raise TypeError unless feed_dto.is_a? FeedDto

    builder = Nokogiri::XML::Builder.new(encoding: 'UTF-8') do |xml|
      xml.feed('xmlns' => 'http://www.w3.org/2005/Atom') do
        create_root_node(xml, feed_dto)
        feed_dto.items&.each do |o|
          create_entry(xml, o)
        end
      end
    end
    builder.to_xml
  end

  private

  def create_root_node(xml, feed_dto)
    xml.title feed_dto.title
    xml.subtitle feed_dto.subtitle
    xml.id feed_dto.id
    xml.updated feed_dto.updated
  end

  def create_entry(xml, item_dto)
    xml.entry do
      xml.id item_dto.id
      xml.updated item_dto.update_date
      xml.link(rel: 'alternate', type: 'text/html', href: item_dto.link)
      xml.published item_dto.published_date
      create_author(xml, item_dto)
      xml.title item_dto.title
      xml.summary item_dto.description
    end
  end

  def create_author(xml, item_dto)
    xml.author do
      xml.name item_dto.author[:name]
      xml.uri item_dto.author[:uri]
      xml.email item_dto.author[:email]
    end
  end
end
