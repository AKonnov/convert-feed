# frozen_string_literal: true

# Feed item dto for manipulation data
class FeedItemDto
  attr_reader :id, :title, :link, :description, :author

  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @link = data[:link]
    @description = data[:description]
    @published_date = data[:published_date]
    @author = data[:author]
    @update_date = data[:update_date] || data[:published_date]
  end

  def published_date
    DateTime.parse @published_date
  end

  def update_date
    DateTime.parse @update_date
  end

end
