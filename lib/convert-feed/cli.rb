# frozen_string_literal: true

require 'optparse'
require_relative '../executor'

PROGRAM_NAME = 'convert-feed'

module ConvertFeed
  # CLI validate and parsed options. Execute command with args
  class CLI
    def run(argv)
      if argv.empty?
        print 'Missing arguments, see help for additional info'
        return true
      end

      parsed_options = parsed_options(argv)
      return parsed_options if parsed_options.nil?

      Executor.new.exec_command(parsed_options, argv.first)
    end

    private

    def parsed_options(args)
      parsed_options = {}
      opt_parser = OptionParser.new do |options|
        options.banner = "Usage: #{PROGRAM_NAME} [options]"
        options.on('-r', '--[no-]reverse', 'Reverse items') do |r|
          parsed_options[:reverse] = r
        end
        options.on('-s', '--[no-]sort', 'Sort items by published date') do |s|
          parsed_options[:sort] = s
        end
        options.on('-o', '--out FORMAT', 'Output feed format: atom/rss/xml') do |type|
          raise TypeError, 'Please, specify output format' if type.nil?
          
          parsed_options[:out_format] = type.downcase
        end
        options.on('-f', '--file FILENAME', 'Output into file FILENAME') do |filename|
          parsed_options[:filename] = filename
        end
        options.on('-h', '--help', 'Show this message') do
          print options
          return nil
        end
      end

      opt_parser.parse!(args)
      parsed_options
    end
  end
end
