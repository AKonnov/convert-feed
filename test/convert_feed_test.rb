# frozen_string_literal: true

require 'minitest/autorun'
require_relative './support/command_helper'

class ConvertFeedTest < Minitest::Test
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
end
