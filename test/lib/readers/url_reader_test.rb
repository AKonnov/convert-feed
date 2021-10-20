# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../../lib/source_readers/url_reader'

class UrlReaderTest < Minitest::Test
  def test_can_read
    # TODO: - this is a bad idea :( Need starting local server and use it
    assert UrlReader.can_read?('https://ru.hexlet.io/lessons.rss')
  end
end
