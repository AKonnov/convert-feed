# frozen_string_literal: true

require 'minitest/autorun'
require_relative './support/command_helper'

class ConvertFeedTest < Minitest::Test
  include CommandHelper
  def test_command_success
    run_command 'convert-feed -f'
    assert_equal 'hello', last_command.output
    assert_equal 0, last_command.exit_status
  end

  def test_cmd_fail_without_args
    run_command 'convert-feed'
    assert_equal 1, last_command.exit_status
  end
end
