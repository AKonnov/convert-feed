# frozen_string_literal: true

# Convert data to Atom format
class AtomConvertor
  def self.can_convert?(type)
    type.to_s.downcase == 'atom'
  end

  def self.convert(_data)
    raise NotImplementedError, 'Need implement'
  end
end
