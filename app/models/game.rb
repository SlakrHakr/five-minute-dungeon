class Game
  def initialize(attributes = {})
    @attributes = if attributes.present?
                    attributes
                  else
                    boss_init = Boss.all.sample
                    { id: SecureRandom.urlsafe_base64,
                      boss: boss_init,
                      doors: Door.all.shuffle[0..boss_init.door_count],
                      players: [Player.new] }
                  end
  end

  def id
    @attributes[:id]
  end

  def boss
    @attributes[:boss]
  end

  def doors
    @attributes[:doors]
  end

  def players
    @attributes[:players]
  end

  def players=(value)
    @attributes[:players] = value
  end
end
