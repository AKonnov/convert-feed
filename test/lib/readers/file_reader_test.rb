# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../../lib/source_readers/file_reader'

FILEPATH = File.expand_path('../../fixtures/input_atom.rss', __dir__)

class FileReaderTest < Minitest::Test
  def test_can_read
    assert FileReader.can_read?(FILEPATH)
  end

  def test_read
    readed = FileReader.new.read(FILEPATH)
    assert readed.length > 10
    assert readed.index('xml version="1.0" encoding="UTF-8"')
  end
end
