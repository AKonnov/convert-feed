# frozen_string_literal: true

require_relative '../parsers/atom_parser'
require_relative '../parsers/rss_parser'

PARSERS = [AtomParser, RssParser].freeze

# Create parser depending on data structure
class ParsersRegistry
  def self.create_parser(data)
    parser = PARSERS.find { |r| r.can_parse?(data) }
    raise TypeError, "'Can`t parse data: #{data.slice(0..140)} .." if parser.nil?

    parser.new
  end
end
