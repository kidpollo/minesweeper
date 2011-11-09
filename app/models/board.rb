class Board < ActiveRecord::Base
  has_many :mines
  def set_mine(x,y)
    mines.create(:x=>x, :y=>y)
  end
end
