# frozen_string_literal: true

# Convert data to rss format
class RssConvertor
  def self.can_convert?(type)
    type.to_s.downcase == 'rss'
  end

  def self.convert(_data)
    raise NotImplementedError, 'Need implement'
  end
end
