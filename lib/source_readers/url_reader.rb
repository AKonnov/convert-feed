# frozen_string_literal: true

require 'net/http'

# Read data from Url if can
class UrlReader
  def self.can_read?(source)
    uri = URI.parse(source)
    response = Net::HTTP.get_response(uri)
    response.is_a?(Net::HTTPSuccess)
  rescue StandardError
    false
  end

  def read(source)
    raise NotImplementedError, 'Need implement'
  end
end
