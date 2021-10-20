# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../../lib/source_readers/file_reader'

FILEPATH = File.expand_path('../../fixtures/input_atom.rss', __dir__)

class FileReaderTest < Minitest::Test
  def test_can_read
    assert FileReader.can_read?(FILEPATH)
  end
end