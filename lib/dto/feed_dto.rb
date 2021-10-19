# frozen_string_literal: true

# Feed dto for manipulation data
class FeedDto
  attr_reader :id, :title, :subtitle, :updated, :items

  def initialize(id, title, subtitle, updated)
    @id = id
    @title = title
    @subtitle = subtitle
    @updated = updated
    @items = []
  end

  def add_item(entry)
    @items.push(entry)
  end
end
