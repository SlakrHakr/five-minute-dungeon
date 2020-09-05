class Player
  def initialize(attributes = {})
    @attributes = if attributes.present?
                    attributes
                  else
                    hero_init = Hero.all.sample
                    { hero: hero_init,
                      name: Haikunator.haikunate(0).titleize.gsub(' ', '-'),
                      hand: hero_init.cards.shuffle[0..5] }
                  end
  end

  def hero
    @attributes[:hero]
  end

  def name
    @attributes[:name]
  end

  def hand
    @attributes[:hand]
  end
end
