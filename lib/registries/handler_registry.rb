# frozen_string_literal: true

require_relative '../handlers/reverse_handler'
require_relative '../handlers/sort_handler'

HANDLERS = [SortHandler, ReverseHandler].freeze

# Call each handlers with options
# Each handler decides for himself how handle FeedDto data
class HandlerRegistry
  def self.handle(options, data)
    HANDLERS.each do |h|
      data = h.handle(options, data)
    end
    data
  end
end
