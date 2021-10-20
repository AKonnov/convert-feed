# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../../lib/registries/handler_registry'
require_relative '../../helpers/parser_helpers'
require 'date'

DATE_NOW = Date.today

class HandlerRegistryTest < Minitest::Test
  def test_sort_by_date_handler
    options = { sort: true }
    feed = create_default_root_element
    create_initial_items_for_sort.each { |i| feed.add_item(i) }
    sorted_feed = HandlerRegistry.handle(options, feed)
    assert_equal sorted_feed.items.first.published_date, (DATE_NOW - 4).to_datetime
    assert sorted_feed.items.first.published_date < sorted_feed.items.last.published_date
  end

  def test_reverse_handler
    options = { reverse: true }
    feed = create_default_root_element
    create_initial_items_for_sort.each { |i| feed.add_item(i) }
    sorted_feed = HandlerRegistry.handle(options, feed)
    assert_equal 'Post 4', sorted_feed.items.first.title
  end

  def test_no_change
    options = {}
    feed = create_default_root_element
    create_initial_items_for_sort.each { |i| feed.add_item(i) }
    sorted_feed = HandlerRegistry.handle(options, feed)
    assert_equal 'Post 0', sorted_feed.items.first.title
    assert_equal DATE_NOW.to_datetime.to_s, sorted_feed.items.first.published_date.to_s
  end

  private

  def create_initial_items_for_sort
    expected_items = []
    5.times do |i|
      object_data = {
        id: "https://ru.hexlet.io/#{i}", title: "Post #{i}", link: "https://ru.hexlet.io/#{i}",
        description: 'description', published_date: (DATE_NOW - i).to_datetime.to_s,
        update_date: (DATE_NOW - i).to_datetime.to_s  # new first
      }
      expected_items.push(FeedItemDto.new(object_data))
    end
    expected_items
  end
end
