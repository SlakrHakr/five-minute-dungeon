module Heroes
  class Huntress < Hero
    def cards
      [Actions::Arrow.new, Actions::Arrow.new, Actions::Arrow.new]
    end
  end
end
