class Boss < Door
  def self.find(id)
    Boss.all.detect { |door| door[:id] == id }
  end

  def self.find!(id)
    boss = Boss.all.detect { |boss| boss[:id] == id }
    raise 'Boss Not Found' if boss.blank?

    boss
  end

  def self.all
    [
      Boss.new(id: 1,
               type: :monster,
               door_count: 20,
               actions: [Actions::Sword.new, Actions::Sword.new,
                         Actions::Arrow.new, Actions::Arrow.new,
                         Actions::Jump.new, Actions::Jump.new, Actions::Jump.new]),
    ]
  end

  def door_count
    @attributes[:door_count]
  end

  protected

  def defeat_action?(action)
    false
  end
end
