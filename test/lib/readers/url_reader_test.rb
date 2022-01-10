# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../../lib/source_readers/url_reader'

URL_FOR_TEST = 'https://ru.hexlet.io/lessons.rss'

# TODO: - this is a bad idea -testing by real url
#         :( Need starting local server and use it
class UrlReaderTest < Minitest::Test
  def test_can_read
    assert UrlReader.can_read?(URL_FOR_TEST)
  end

  def test_read
    readed = UrlReader.new.read(URL_FOR_TEST)
    assert readed.length > 10
    assert readed.index('xml version="1.0" encoding="UTF-8"')
  end
end
