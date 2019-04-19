class Player

DEFAULT_HIT_POINTS = 60
MINIMUM_HIT_POINTS = 0

attr_reader :name, :hit_points

  def initialize(name, hit_points = DEFAULT_HIT_POINTS)
    @name = name
    @hit_points = hit_points
  end

  def receive_damage
    @hit_points -= 10
  end

  def died?
    @hit_points == MINIMUM_HIT_POINTS
  end

end
