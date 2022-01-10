# frozen_string_literal: true

require_relative '../source_readers/file_reader'
require_relative '../source_readers/url_reader'

READERS = [FileReader, UrlReader].freeze

# ReadersRegistry class
class ReadersRegistry
  def self.create_reader(source)
    reader = READERS.find { |r| r.can_read?(source) }
    raise TypeError, "'Can`t read source #{source}" if reader.nil?

    reader.new
  end
end
