# frozen_string_literal: true

# Read data from file
class FileReader
  def self.can_read?(source)
    File.file?(source)
  end

  def self.read(source)
    raise NotImplementedError, 'Need implement'
  end
end
