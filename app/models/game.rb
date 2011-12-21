class Game < ActiveRecord::Base
  before_save do |game|
    game.name.gsub!(' ', '_')
  end
  
  def to_param
    name
  end
  
  def set_mine(x, y)
  end
  
end
