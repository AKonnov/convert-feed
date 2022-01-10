# frozen_string_literal: true

require_relative '../lib/registries/readers_registry'
require_relative '../lib/registries/parsers_registry'
require_relative '../lib/registries/convertors_registry'
require_relative '../lib/registries/handler_registry'
require_relative '../lib/registries/writers_registry'

# Doc
class Executor
  def exec_command(options, source)
    reader = ReadersRegistry.create_reader(source)
    data = reader.read(source)
    parser = ParsersRegistry.create_parser(data)
    handled_feed = HandlerRegistry.handle(options, parser.parse(data))
    convertor = ConvertorsRegistry.create_convertor(options)
    data = convertor.convert(handled_feed)
    WritersRegistry.write(options, data)
  rescue StandardError => e
    puts(e)
    false
  end
end
