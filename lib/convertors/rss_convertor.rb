# frozen_string_literal: true

# Convert data to Rss format
class RssConvertor
  def self.can_convert?(type)
    type.to_s.downcase == 'rss'
  end

  def convert(feed_dto)
    raise TypeError unless feed_dto.is_a? FeedDto

    builder = Nokogiri::XML::Builder.new(encoding: 'UTF-8') do |xml|
      xml.rss('version' => '2.0') do
        create_channel(xml, feed_dto)
      end
    end
    builder.to_xml
  end

  private

  def create_channel(xml, feed_dto)
    xml.channel do
      create_root_node(xml, feed_dto)
      feed_dto.items&.each do |o|
        create_item(xml, o)
      end
    end
  end

  def create_root_node(xml, feed_dto)
    xml.title feed_dto.title
    xml.description feed_dto.subtitle
    xml.link feed_dto.id
    xml.webMaster feed_dto.items.first.author[:email]
  end

  def create_item(xml, item_dto)
    xml.item do
      xml.title item_dto.title
      xml.link item_dto.link
      xml.description item_dto.description
      xml.pubDate item_dto.published_date.rfc822
    end
  end
end
