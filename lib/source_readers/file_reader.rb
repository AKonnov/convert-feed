# frozen_string_literal: true

# Read data from file
class FileReader
  def self.can_read?(source)
    File.file?(source)
  end

  def read(source)
    File.read(source)
  end
end
