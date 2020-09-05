module Heroes
  class Wizard < Hero
    def cards
      [Actions::Scroll.new, Actions::Scroll.new, Actions::Scroll.new]
    end
  end
end
