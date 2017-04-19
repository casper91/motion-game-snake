class InputManager

  def swipe_direction(event)
    start_location = event.start_location
    end_location = event.location

    angle_deg = rad_to_deg((end_location - start_location).angle)

    if(45 < angle_deg && angle_deg < 135)
      :up
    elsif(-135 < angle_deg && angle_deg < -45)
      :down
    elsif(-45 <= angle_deg && angle_deg <= 45)
      :right
    elsif(135 <= angle_deg || angle_deg <= -135)
      :left
    else
      :unknown
    end
  end

  protected

  def rad_to_deg(rad)
    rad * 180 / Math::PI
  end
end