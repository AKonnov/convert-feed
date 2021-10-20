# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../../lib/registries/writers_registry'

TEST_DATA = 'somedata'
TEST_FILENAME = 'test_output.rss'
EXPECTED_FILE = File.expand_path("../../../#{TEST_FILENAME}", __FILE__)

class WritersRegistryTest < Minitest::Test
  def setup
    abort("File #{EXPECTED_FILE} exist!! Delete it (if you need) before start test") if File.exist?(EXPECTED_FILE)
  end

  def teardown
    File.delete EXPECTED_FILE if File.exist? EXPECTED_FILE
  end

  def test_write_in_output_default
    options = {}
    out, err = capture_io do
      WritersRegistry.write options, TEST_DATA
    end
    assert_equal TEST_DATA, out.chomp
  end

  def test_write_in_file
    options = { file: EXPECTED_FILE }
    WritersRegistry.write options, TEST_DATA
    expected_file = File.expand_path(EXPECTED_FILE)
    assert_equal TEST_DATA, File.read(expected_file).chomp
  end

  def test_exception_existing_file
    options = { file: EXPECTED_FILE }
    WritersRegistry.write options, TEST_DATA
    assert_raises ArgumentError do
      WritersRegistry.write options, TEST_DATA
    end
  end
end
