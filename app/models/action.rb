class Action
  def initialize(attributes)
    @attributes = attributes
  end

  def id
    @attributes[:id]
  end

  def type
    @attributes[:type]
  end
end
