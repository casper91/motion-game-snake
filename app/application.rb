class Application < MG::Application
  def start
    director = MG::Director.shared
    #director.show_stats = true
    director.glview.design_resolution_size(GameConstants::SCENE_WIDTH, GameConstants::SCENE_HEIGHT, MG::ResolutionPolicy::SHOW_ALL)
    director.content_scale_factor = 1.0
    director.run(MG::GameScene.new)
  end

  def resume
    # Will be called when app will move to active state from background.
    #puts "Resume"
  end

  def pause
    # Will be called when app will move to background from active state.
    #puts "Paused"
  end
end
