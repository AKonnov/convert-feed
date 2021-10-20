# frozen_string_literal: true

require_relative '../../lib/dto/feed_dto'
require_relative '../../lib/dto/feed_item_dto'

FEED_DTO_ROOT_ELEMENT = FeedDto.new(
  'https://ru.hexlet.io/',
  'Новые уроки на Хекслете',
  'Практические уроки по программированию',
  '2021-10-18T08:41:12+00:00'
)
FEED_DTO_ITEM_0 = {
  id: 'https://ru.hexlet.io/courses/gulp/lessons/gulpfile/theory_unit',
  title: 'Gulpfile / Gulp',
  link: 'https://ru.hexlet.io/courses/gulp/lessons/gulpfile/theory_unit',
  description: 'Цель: Изучить базовую структуру gulpfile.js. Создать свои первые задачи и научиться их экспортировать',
  published_date: '2021-10-18T08:41:12+00:00',
  update_date: '2021-10-18T08:41:12+00:00',
  author: { name: 'info@hexlet.io', uri: 'https://ru.hexlet.io/', email: 'info@hexlet.io' }
}.freeze
FEED_DTO_ROOT_ELEMENT.add_item(FeedItemDto.new(FEED_DTO_ITEM_0))
FEED_DTO_ITEM_1 = {
  id: 'https://ru.hexlet.io/courses/gulp/lessons/install/theory_unit',
  title: 'Установка / Gulp',
  link: 'https://ru.hexlet.io/courses/gulp/lessons/install/theory_unit',
  description: 'Цель: Научиться устанавливать Gulp и изучить базовые опции при работе с ним',
  published_date: '2021-10-18T08:41:08+00:00',
  update_date: '2021-10-18T08:41:08+00:00',
  author: { name: 'info@hexlet.io', uri: 'https://ru.hexlet.io/', email: 'info@hexlet.io' }
}.freeze
FEED_DTO_ROOT_ELEMENT.add_item(FeedItemDto.new(FEED_DTO_ITEM_1))
FEED_DTO_ITEM_2 = {
  id: 'https://ru.hexlet.io/courses/gulp/lessons/intro/theory_unit',
  title: 'Введение / Gulp',
  link: 'https://ru.hexlet.io/courses/gulp/lessons/intro/theory_unit',
  description: 'Цель: Узнать о таск-менеджере Gulp и сферах его применения',
  published_date: '2021-10-18T08:41:05+00:00',
  update_date: '2021-10-18T08:41:05+00:00',
  author: { name: 'info@hexlet.io', uri: 'https://ru.hexlet.io/', email: 'info@hexlet.io' }
}.freeze
FEED_DTO_ROOT_ELEMENT.add_item(FeedItemDto.new(FEED_DTO_ITEM_2))
FEED_DTO_ITEM_3 = {
  id: 'https://ru.hexlet.io/courses/js-react-hooks/lessons/use-ref/theory_unit',
  title: 'Хук useRef / JS: React Hooks',
  link: 'https://ru.hexlet.io/courses/js-react-hooks/lessons/use-ref/theory_unit',
  description: 'Цель: Познакомиться с курсом и подготовить окружение',
  published_date: '2021-10-15T19:56:40+00:00',
  update_date: '2021-10-15T19:56:40+00:00',
  author: { name: 'info@hexlet.io', uri: 'https://ru.hexlet.io/', email: 'info@hexlet.io' }
}.freeze
FEED_DTO_ROOT_ELEMENT.add_item(FeedItemDto.new(FEED_DTO_ITEM_3))
FEED_DTO_ITEM_4 = {
  id: 'https://ru.hexlet.io/courses/js-react-hooks/lessons/use-context/theory_unit',
  title: 'Хук useContext / JS: React Hooks',
  link: 'https://ru.hexlet.io/courses/js-react-hooks/lessons/use-context/theory_unit',
  description: 'Цель: Научиться работать с контекстом через хуки',
  published_date: '2021-10-15T19:56:36+00:00',
  update_date: '2021-10-15T19:56:36+00:00',
  author: { name: 'info@hexlet.io', uri: 'https://ru.hexlet.io/', email: 'info@hexlet.io' }
}.freeze
FEED_DTO_ROOT_ELEMENT.add_item(FeedItemDto.new(FEED_DTO_ITEM_4))
