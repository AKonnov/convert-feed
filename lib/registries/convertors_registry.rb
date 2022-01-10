# frozen_string_literal: true

require_relative '../convertors/atom_convertor'
require_relative '../convertors/rss_convertor'

CONVERTORS = [AtomConvertor, RssConvertor].freeze

# ConvertorsRegistry choose convertor from options
class ConvertorsRegistry
  def self.create_convertor(options)
    convertor = CONVERTORS.find { |r| r.can_convert?(options[:out_format]) }
    raise TypeError, "'Can`t output data to #{options[:out_format]} format" if convertor.nil?

    convertor.new
  end
end
