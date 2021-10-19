# frozen_string_literal: true

# Reverse FeedDto[items]
class ReverseHandler
  def self.handle(options, data)
    data.items.reverse! if options[:reverse]
    data
  rescue StandardError => e
    puts "Can`t reverse items: #{e.message}"
  end
end
