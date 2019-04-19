
# As two Players,
# So we can play a personalised game of Battle,
# We want to Start a fight by entering our Names and seeing them

feature 'player form' do
  scenario 'gets players names' do
    sign_in_and_play
    expect(page).to have_content("Sarpong", "Gui")
  end
end

  # As Player 1,
  # So I can see how close I am to winning
  # I want to see Player 2's Hit Points

feature 'players points' do
  scenario 'player 1 can see player 2 hit points' do
    sign_in_and_play
    expect(page).to have_content("Gui: [100 HP]")
  end
end

# As Player 1,
# So I can win a game of Battle,
# I want to attack Player 2, and I want to get a confirmation

feature 'attacking player 2' do
  scenario 'player_1 attacks player_2 and sees confirmation' do
    sign_in_and_play
    attack
    expect(page).to have_content("Gui was hit")
  end
end
