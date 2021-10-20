# frozen_string_literal: true

require 'minitest/autorun'
require 'nokogiri'
require_relative '../lib/executor'

class ExecutorTest < Minitest::Test
  RSS_FIXTURE_FILEPATH = File.expand_path('fixtures/input_rss.rss', __dir__)
  RSS_REVERSED_FIXTURE_FILEPATH = File.expand_path('fixtures/input_rss.rss', __dir__)
  RSS_NO_SORT_FIXTURE_FILEPATH = File.expand_path('fixtures/input_rss.not_sorted.rss', __dir__)
  ATOM_REVERSED_FIXTURE_FILEPATH = File.expand_path('../test/fixtures/input_atom.reversed.rss', __dir__)
  ATOM_NO_SORT_FIXTURE_FILEPATH = File.expand_path('../test/fixtures/input_atom.not_sorted.rss', __dir__)
  ATOM_FIXTURE_FILEPATH = File.expand_path('../test/fixtures/input_atom.rss', __dir__)

  def test_rss_to_atom_to_output
    options = { out: 'atom' }
    source = RSS_FIXTURE_FILEPATH
    out, err = capture_io do
      Executor.new.exec_command(options, source)
    end

    expected_result = File.read(ATOM_FIXTURE_FILEPATH)
    assert_equal expected_result.chomp, out.chomp
  end

  def test_rss_to_rss_to_output
    options = { out: 'rss' }
    source = RSS_FIXTURE_FILEPATH
    out, err = capture_io do
      Executor.new.exec_command(options, source)
    end

    expected_result = File.read(RSS_FIXTURE_FILEPATH)
    assert_equal expected_result.chomp, out.chomp
  end

  def test_atom_to_atom_to_output
    options = { out: 'atom' }
    source = ATOM_FIXTURE_FILEPATH
    out, err = capture_io do
      Executor.new.exec_command(options, source)
    end

    expected_result = File.read(ATOM_FIXTURE_FILEPATH)
    assert_equal expected_result.chomp, out.chomp
  end

  def test_atom_to_rss_to_output
    options = { out: 'rss' }
    source = ATOM_FIXTURE_FILEPATH
    out, err = capture_io do
      Executor.new.exec_command(options, source)
    end

    expected_result = File.read(RSS_FIXTURE_FILEPATH)
    assert_equal expected_result.chomp, out.chomp
  end

  def test_rss_to_atom_reverse_to_output
    options = { out: 'atom', reverse: true }
    source = RSS_FIXTURE_FILEPATH
    out, err = capture_io do
      Executor.new.exec_command(options, source)
    end

    expected_result = File.read(ATOM_REVERSED_FIXTURE_FILEPATH)
    assert_equal expected_result.chomp, out.chomp
  end

  def test_atom_to_rss_sort_to_output
    options = { out: 'rss', sort: true, reverse: true }
    source = ATOM_NO_SORT_FIXTURE_FILEPATH
    out, err = capture_io do
      Executor.new.exec_command(options, source)
    end

    expected_result = File.read(RSS_FIXTURE_FILEPATH)
    assert_equal expected_result.chomp, out.chomp
  end

  def test_rss_to_atom_sort_to_output
    options = { out: 'atom', sort: true, reverse: true }
    source = RSS_NO_SORT_FIXTURE_FILEPATH
    out, err = capture_io do
      Executor.new.exec_command(options, source)
    end

    expected_result = File.read(ATOM_FIXTURE_FILEPATH)
    assert_equal expected_result.chomp, out.chomp
  end
end
