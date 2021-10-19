# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../../lib/registries/parsers_registry'
require_relative '../../helpers/parser_helpers'

class RssParserTest < Minitest::Test
  def test_parse
    rss = File.read(File.expand_path('../../fixtures/input_rss.rss', __dir__))
    result = RssParser.new.parse(rss)
    assert_obj_fields_equal EXPECTED_ROOT_ELEMENT, result, %w[id title subtitle updated]
    assert_obj_fields_equal EXPECTED_FIRST_ITEM_ELEMENT, result.items.first, %w[id title link published_date update_date]
  end
end
