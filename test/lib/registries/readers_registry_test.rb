# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../../lib/registries/readers_registry'

class ReadersRegistryTest < Minitest::Test
  def test_create_reader_url
    reader = ReadersRegistry.create_reader('https://ru.hexlet.io/lessons.rss')
    assert_equal UrlReader, reader.class
  end

  def test_create_reader_file
    reader = ReadersRegistry.create_reader(File.expand_path('../../fixtures/input_atom.rss', __dir__))
    assert_equal FileReader, reader.class
  end

  def test_exception_unknown_reader
    assert_raises TypeError do
      ReadersRegistry.create_reader('somestring')
    end
  end
end
