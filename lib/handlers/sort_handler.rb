# frozen_string_literal: true

# Sort FeedDto[items] by update_date
class SortHandler
  def self.handle(options, data)
    data.items.sort_by!(&:update_date) if options[:sort]
    data
  rescue StandardError => e
    puts "Can`t sort by update date: #{e.message}"
  end
end
