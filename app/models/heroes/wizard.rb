module Heroes
  class Wizard < Hero
    def cards
      [Actions::Arrow.new, Actions::Jump.new, Actions::Scroll.new, Actions::Shield.new, Actions::Sword.new]
    end
  end
end
