class MinesweeperController < ApplicationController
  def welcome
    
  end

  def create
    @board = Board.new(params[:board])
    @board.save
    redirect_to "/#{@board.name.gsub(" ","_")}"
  end
  
  def show
    
  end
end
