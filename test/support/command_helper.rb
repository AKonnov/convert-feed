# frozen_string_literal: true

require_relative '../../lib/convert-feed/cli'

module CommandHelper
  Command = Struct.new(:exit_status, :output, :error)

  def run_command(command_invocation)
    puts "> #{command_invocation}"
    arguments = command_invocation.split(' ')
    raise "Not invoking convert-feed? #{command_invocation}" unless arguments.shift == 'convert-feed'

    output, error = capture_io do
      last_command.exit_status = ConvertFeed::CLI.new.run(arguments).nil? ? 0 : 1
    end
    last_command.output = output
    last_command.error = error
  end

  def last_command
    @last_command ||= Command.new
  end
end
