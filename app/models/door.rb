class Door
  def initialize(attributes = {})
    @attributes = attributes
  end

  def self.find(id)
    Door.all.detect { |door| door[:id] == id }
  end

  def self.find!(id)
    door = Door.all.detect { |door| door[:id] == id }
    raise 'Door Not Found' if door.blank?

    door
  end

  def self.all
    [
      Door.new(id: 1, type: :monster, actions: [Actions::Jump.new, Actions::Shield.new]),
      Door.new(id: 2, type: :obstacle, actions: [Actions::Sword.new, Actions::Scroll.new, Actions::Jump.new]),
      Door.new(id: 3, type: :person, actions: [Actions::Sword.new, Actions::Sword.new, Actions::Scroll.new]),
      Door.new(id: 4, type: :obstacle, actions: [Actions::Scroll.new, Actions::Arrow.new, Actions::Arrow.new]),
      Door.new(id: 5, type: :obstacle, actions: [Actions::Scroll.new, Actions::Scroll.new, Actions::Scroll.new])
    ]
    # TODO: define the rest
  end

  def id
    @attributes[:id]
  end

  def actions
    @attributes[:actions]
  end

  def attack(action)
    raise 'Invalid Action' unless valid_action?(action)

    @attributes[:actions] = if defeat_action?(action)
                              []
                            else
                              @attributes[:actions].delete_at(@attributes[:actions].map(&:type).index(action.type))
                            end
  end

  protected

  def defeat_action?(action)
    # TODO: if action is a special that defeats door in one blow
    false
  end

  def valid_action?(action)
    defeat_action?(action) || @attributes[:actions].map(&:type).include?(action.type)
  end
end
