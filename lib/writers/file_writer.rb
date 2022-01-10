# frozen_string_literal: true

# Write data in file
class FileWriter
  def write(source, filename)
    raise ArgumentError, "File #{filename} already exist!!!" if File.exist? filename

    file = File.open(filename, 'w')
    file.write(source)
    file.close
  end
end
