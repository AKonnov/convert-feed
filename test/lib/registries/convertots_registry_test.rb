# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../../lib/registries/convertors_registry'

class ConvertorRegistryTest < Minitest::Test
  def test_create_atom_convertor
    options = { out_format: 'atom' }
    convertor = ConvertorsRegistry.create_convertor(options)
    assert_equal AtomConvertor, convertor.class
  end

  def test_create_rss_convertor
    options = { out_format: 'rss' }
    convertor = ConvertorsRegistry.create_convertor(options)
    assert_equal RssConvertor, convertor.class
  end

  def test_exception_unknown_format
    assert_raises TypeError do
      ConvertorsRegistry.create_convertor({out_format: 'magic_rss_format' })
    end
  end
end
