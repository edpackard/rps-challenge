require_relative '../../app.rb'

feature "playing the game" do

  scenario "allows user to select a weapon" do
    ['Rock', 'Paper', 'Scissors'].each do |weapon|
      sign_in_and_play
      choose weapon
      click_button 'Confirm Choice'
      expect(page).to_not have_content("Choose your weapon, Ed")
      expect(page).to have_content("You have chosen #{weapon}")
    end
  end

  scenario "computer selects a weapon" do
    sign_in_and_play(5)
    player_chooses_rock
    expect(page).to have_content("Your opponent has chosen Scissors")
  end

  scenario "player & computer select same weapon: drawn game" do
    sign_in_and_play(2)
    player_chooses_rock
    expect(page).to have_content("It's a draw!")
  end

  scenario "player rock & computer paper: computer wins" do
    sign_in_and_play
    player_chooses_rock
    expect(page).to have_content("You lose!")
  end

  scenario "player rock & computer scissors: player wins" do
    sign_in_and_play(5)
    player_chooses_rock
    expect(page).to have_content("You win!")
  end

end