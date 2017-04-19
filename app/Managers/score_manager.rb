class ScoreManager

  def initialize(scene)
    @scene = scene
    @score = 0

    setup_score_board

    @score_label = create_score_label
  end

  def increase_score(point = 1)
    @score += 1
    update_score_label
  end

  def reset
    @score = 0
    update_score_label
  end

  private

  def setup_score_board
    MG::Sprite.new('score_board.png').tap do |bg|
      bg.anchor_point = [0,0]
      bg.position = [0, GameConstants::GAME_HEIGHT]
      @scene.add(bg)
    end
  end

  def create_score_label
    MG::Text.new(sprintf("Score: %.4d", @score), "fonts/lcd_solid.ttf", 40).tap do |label|
      label.anchor_point = [0.5, 0.5]
      label.position = [150, 600]
      @scene.add(label)
    end
  end

  def update_score_label
    @score_label.text = sprintf("Score: %.4d", @score)
  end
end