# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../../lib/registries/handler_registry'
require_relative '../../helpers/parser_helpers'
require 'date'

DATE_NOW = Date.today

class HandlerRegistryTest < Minitest::Test
  def test_sort_by_date_handler
    options = { sort: true }
    feed = EXPECTED_ROOT_ELEMENT
    create_initial_items_for_sort.each { |i| feed.add_item(i) }
    sorted_feed = HandlerRegistry.handle(options, feed)
    assert_equal sorted_feed.items.first.published_date, (DATE_NOW - 4).to_datetime
  end

  def test_reverse_handler
    options = { reverse: true }
    feed = EXPECTED_ROOT_ELEMENT
    create_initial_items_for_sort.each { |i| feed.add_item(i) }
    sorted_feed = HandlerRegistry.handle(options, feed)
    assert_equal sorted_feed.items.first.title, 'Post 4'
  end

  def test_no_change
    options = {}
    feed = EXPECTED_ROOT_ELEMENT
    create_initial_items_for_sort.each { |i| feed.add_item(i) }
    sorted_feed = HandlerRegistry.handle(options, feed)
    assert_equal sorted_feed.items.first.title, 'Post 0'
    assert_equal sorted_feed.items.first.published_date, DATE_NOW.to_datetime
  end

  private

  def create_initial_items_for_sort
    expected_items = []
    5.times do |i|
      object_data = {
        id: "https://ru.hexlet.io/#{i}", title: "Post #{i}", link: "https://ru.hexlet.io/#{i}",
        description: 'description', published_date: (DATE_NOW - i).to_datetime,
        update_date: (DATE_NOW - i).to_datetime  # new first
      }
      expected_items.push(FeedItemDto.new(object_data))
    end
    expected_items
  end
end
