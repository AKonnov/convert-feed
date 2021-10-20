# frozen_string_literal: true

require_relative '../../lib/dto/feed_item_dto'
require_relative '../../lib/dto/feed_dto'

def create_default_root_element
  FeedDto.new(
    'https://ru.hexlet.io/',
    'Новые уроки на Хекслете',
    'Практические уроки по программированию',
    '2021-10-18T08:41:12+00:00'
  )
end

EXPECTED_FIRST_ITEM_DATA = {
  id: 'https://ru.hexlet.io/courses/gulp/lessons/gulpfile/theory_unit',
  title: 'Gulpfile / Gulp',
  link: 'https://ru.hexlet.io/courses/gulp/lessons/gulpfile/theory_unit',
  description: 'Цель: Изучить базовую структуру gulpfile.js. Создать свои первые задачи и научиться их экспортировать',
  published_date: '2021-10-18T08:41:12+00:00',
  update_date: '2021-10-18T08:41:12+00:00',
  author: { name: 'info@hexlet.io', uri: 'https://ru.hexlet.io/', email: 'info@hexlet.io' }
}.freeze
EXPECTED_FIRST_ITEM_ELEMENT = FeedItemDto.new(EXPECTED_FIRST_ITEM_DATA)

def assert_obj_fields_equal(obj1, obj2, fields)
  fields.each do |f|
    assert_equal obj1.send(f), obj2.send(f)
  end
end
