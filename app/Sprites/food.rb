class Food

  def initialize(scene)
    @random = Random.new

    @food_sprite = create_food_sprite
    scene.add(@food_sprite)
  end

  def respawn
    @food_sprite.position = random_position
  end

  def position
    @food_sprite.position
  end

  protected

  def create_food_sprite
    MG::Sprite.new('food.png').tap do |food|
      food.position = random_position
    end
  end

  def random_position
    [(@random.rand(0...(GameConstants::GAME_WIDTH / 32)) * 32) + 16, (@random.rand(0...(GameConstants::GAME_HEIGHT / 32)) * 32) + 16]
  end
end