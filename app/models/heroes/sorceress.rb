module Heroes
  class Sorceress < Heroes::Wizard
    def cards
      [Actions::Arrow.new, Actions::Jump.new, Actions::Scroll.new, Actions::Shield.new, Actions::Sword.new]
    end
  end
end
