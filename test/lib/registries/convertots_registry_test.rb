# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../../lib/registries/convertors_registry'

class ConvertorRegistryTest < Minitest::Test
  def test_create_atom_convertor
    options = { out: 'atom' }
    convertor = ConvertorsRegistry.create_convertor(options)
    assert_equal AtomConvertor, convertor.class
  end

  def test_create_rss_convertor
    options = { out: 'rss' }
    convertor = ConvertorsRegistry.create_convertor(options)
    assert_equal RssConvertor, convertor.class
  end

  def test_exception_no_convertor
    assert_raises TypeError do
      ConvertorsRegistry.create_convertor({})
    end
  end
end
