require 'spec_helper'

feature "Mine Sweeper Landing Page", %q{
  Check the game out
  As a player
  I want to create and manage games
} do

  background do
    visit '/'
  end

  scenario "Boards index welcome" do
    page.should have_content('Welcome to Mine Sweeper')
  end

  scenario "Should be able to create new game" do 
    page.should have_content('New Game:')
    page.should have_field('Name')
    page.should have_field('X')
    page.should have_field('Y')
    page.should have_field('Mines')
    page.should have_button('Create Game')
  end

  scenario 'Should be able to create new game' do
    fill_in('x', :with => '5')
    fill_in('y', :with => '5')
    fill_in('mines', :with => '5')
    fill_in('Name', :with => 'super game')
    click_button('Create Game')
    current_path.should == '/super_game'
  end

end

feature "Mine Sweeprer Game", %q{
  In order to have a player loose a lot of productive time
  As a player
  I want to play the game
} do

  background do
    @board = Board.create!({:x => 5, :y => 5, :mines => 5, :sample_game => 'sample_game'})
    @board.set_mine(1,1)
    visit '/sample_game'
  end

  scenario 'Should prompt for first move' do
    page.should have_content('Do your first move!') 
  end

  scenario 'Should prompt for next move if no mine is clicked' do
    click_link('#2_2')
    page.should have_content('Next Move') 
    current_path.should == '/sample_game'
  end

   scenario 'Should say game over if mine is stepped on' do
    click_link('#1_1')
    page.should have_content('Game Over') 
    current_path.should == '/sample_game'
  end


end
