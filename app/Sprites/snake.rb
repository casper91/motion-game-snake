class Snake

  def initialize(scene)
    @sprite_width = 32
    @sprite_height = 32
    @scene = scene

    create_head
  end

  def move_snake
    @last_tail_position = tail.position
    tail.position = next_position
    @snake.rotate!(-1)
  end

  def food_collision?(food)
    head.position == food.position
  end

  def self_collision?
    @snake[1..-1].any? { |part| head.position == part.position }
  end

  def increment_snake
    new_tail = create_snake_part(@last_tail_position)
    @snake << new_tail
    @scene.add(new_tail)
  end

  def change_direction(direction)
    @direction = direction
  end

  def restart
    @snake.each do |part|
      @scene.delete(part)
    end

    create_head
  end

  protected

  def create_head
    @last_tail_position = nil
    @direction = :right
    @snake = []

    head = create_snake_part([464, 304])
    @scene.add(head)
    @snake << head
  end

  def create_snake_part(position, sprite_src='snake.png')
    MG::Sprite.new(sprite_src).tap do |part|
      part.position = position
    end
  end

  # return head of snake
  def head
    @snake.first
  end

  # return tail of snake
  def tail
    @snake.last
  end

  # return position of head
  def current_position
    head.position
  end

  # calculate next position for head
  def next_position
    case @direction
      when :up
        current_position + MG::Point.new(0, @sprite_height)
      when :down
        current_position + MG::Point.new(0, -@sprite_height)
      when :right
        current_position + MG::Point.new(@sprite_width, 0)
      when :left
        current_position + MG::Point.new(-@sprite_width, 0)
      else
        current_position
    end.tap do |next_position|
      next_position.x %= GameConstants::GAME_WIDTH
      next_position.y %= GameConstants::GAME_HEIGHT
    end
  end
end