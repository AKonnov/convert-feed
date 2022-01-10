# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../../lib/registries/parsers_registry'

class ParsersRegistryTest < Minitest::Test
  def test_create_rss_parser
    rss = File.read(File.expand_path('../../fixtures/input_rss.rss', __dir__))
    parser = ParsersRegistry.create_parser(rss)
    assert_equal RssParser, parser.class
  end

  def test_create_atom_parser
    atom = File.read(File.expand_path('../../fixtures/input_atom.rss', __dir__))
    parser = ParsersRegistry.create_parser(atom)
    assert_equal AtomParser, parser.class
  end

  def test_exception_unknown_parser
    assert_raises TypeError do
      ParsersRegistry.create_parser('somestring not rss or atom')
    end
  end
end
