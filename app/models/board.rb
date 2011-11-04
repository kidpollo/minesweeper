class Board < ActiveRecord::Base
  #attr_accessor :name, :x, :y, :mines
  
  validates_presence_of :name, :x, :y, :mines
   
  def to_param
    name.gsub(' ', '_').downcase
  end
  
  def set_mine(x,y)
  end
end
