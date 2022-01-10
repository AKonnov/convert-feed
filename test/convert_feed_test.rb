# frozen_string_literal: true

require 'minitest/autorun'
require_relative './support/command_helper'

class ConvertFeedTest < Minitest::Test
  ATOM_FIXTURE_FILEPATH = File.expand_path('../test/fixtures/input_atom.rss', __dir__)
  RSS_NO_SORT_FIXTURE_FILEPATH = File.expand_path('fixtures/input_rss.not_sorted.rss', __dir__)

  def setup
    last_command.output = ''
  end

  include CommandHelper
  def test_command_help_success
    run_command 'convert-feed -h'
    assert_equal 'Usage: convert-feed [options]
    -r, --[no-]reverse               Reverse items
    -s, --[no-]sort                  Sort items by published date
    -o, --out FORMAT                 Output feed format: atom/rss/xml
    -f, --file FILENAME              Output into file FILENAME
    -h, --help                       Show this message
', last_command.output
    assert_equal 0, last_command.exit_status
  end

  def test_cmd_fail_without_args
    run_command 'convert-feed'
    assert_equal 'Missing arguments, see help for additional info', last_command.output
    assert_equal 1, last_command.exit_status
  end

  def test_cmd_reverse_from_rss_file_to_atom
    run_command "convert-feed -r -s --out atom #{RSS_NO_SORT_FIXTURE_FILEPATH}"
    expected_result = File.read(ATOM_FIXTURE_FILEPATH)
    assert_equal expected_result.chomp, last_command.output.chomp
    assert_equal "", last_command.error
  end
end
