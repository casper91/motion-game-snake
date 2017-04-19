module MG
  class GameScene < Scene

    def initialize
      @director = Director.shared
      @input_manger = InputManager.new
      @score_manager = ScoreManager.new(self)

      setup_game_area
      setup_restart_button

      @snake = Snake.new(self)
      @food = Food.new(self)

      on_touch_end { |event| touch_handler(event) }

      @schedule_game_loop_key = start_game
    end

    private

    def start_game
      schedule(0, Repeat::FOREVER, 0.1) { |delta| game_loop(delta) }
    end

    def setup_game_area
      Sprite.new('environment_grass.png').tap do |bg|
        bg.anchor_point = [0,0]
        bg.position = [0, 0]
        add(bg)
      end
    end

    def setup_restart_button
      @reset_button = Button.new("Game Lost \n Restart")
      @reset_button.font = 'fonts/lcd_solid.ttf'
      @reset_button.font_size = 48
      @reset_button.position = [GameConstants::SCENE_WIDTH / 2, GameConstants::SCENE_HEIGHT / 2]
      @reset_button.on_touch {|type| restart if type == :end }
    end

    def game_loop(delta)
      @snake.move_snake

      # Collision with Food
      if @snake.food_collision?(@food)
        @snake.increment_snake
        @score_manager.increase_score

        @food.respawn
      end

      if @snake.self_collision?
        game_lost
      end
    end

    def restart
      delete(@reset_button)
      @snake.restart
      @score_manager.reset

      @schedule_game_loop_key = start_game
    end

    def game_lost
      unschedule(@schedule_game_loop_key)

      add(@reset_button)
    end

    def touch_handler(event)
      @snake.change_direction(@input_manger.swipe_direction(event))
    end
  end
end