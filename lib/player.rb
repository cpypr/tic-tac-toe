class Player
  attr_reader :marker, :name, :marker_color

  def initialize(name, marker, marker_color)
    @name = name
    @marker = marker
    @marker_color = marker_color
  end

end
