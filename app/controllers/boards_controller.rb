class BoardsController < ApplicationController

  def index
    @board = Board.new
  end
  
  def create
    @board = Board.new(params[:board])
    @board.save!
    redirect_to @board
  end
  
  def show
    @board = Board.find_by_name(params[:id])
  end
  
end
