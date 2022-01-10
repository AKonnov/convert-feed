# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../fixtures/convertor_data_fixtures'
require_relative '../../../lib/registries/convertors_registry'

class AtomConvertorTest < Minitest::Test
  def test_convert
    expected_result = File.read(File.expand_path('../../fixtures/input_atom.rss', __dir__))
    root_element = FEED_DTO_ROOT_ELEMENT
    convert_data = AtomConvertor.new.convert(root_element)
    assert_equal expected_result.chomp, convert_data.chomp
  end

  def test_exception_nil_data
    assert_raises TypeError do
      AtomConvertor.new.convert(nil)
    end
  end
end
