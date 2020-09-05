class Hero
  def self.all
    [
      Heroes::Huntress.new,
      Heroes::Ranger.new,
      Heroes::Wizard.new,
      Heroes::Sorceress.new
    ]
  end
end
