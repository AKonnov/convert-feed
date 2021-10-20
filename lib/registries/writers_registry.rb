# frozen_string_literal: true

require_relative '../writers/file_writer'
require_relative '../writers/output_writer'

WRITERS = [FileWriter, OutputWriter].freeze

# Choose writer and call this for output
class WritersRegistry
  def self.write(options, source)
    writer = options[:file].nil? ? OutputWriter.new : FileWriter.new
    writer.write(source, options[:file])
  end
end
