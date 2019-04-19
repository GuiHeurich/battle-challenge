# As two Players,
# So we can play a personalised game of Battle,
# We want to Start a fight by entering our Names and seeing them

feature 'Enter names' do
  scenario 'submitting names' do
    sign_in_and_play
    expect(page).to have_content('Callum', 'Gui')
  end
end

# As Player 1,
# So I can see how close I am to winning
# I want to see Player 2's Hit Points

feature 'Hit Points' do
  scenario 'displaying hit points' do
    sign_in_and_play
    expect(page).to have_content 'Callum: 60HP'
  end
end

# As Player 1,
# So I can win a game of Battle,
# I want to attack Player 2, and I want to get a confirmation

feature 'Attacking player' do
  scenario 'player 1 hits player 2' do
    sign_in_and_play
    click_button 'ATTACK'
    expect(page).to have_content 'Callum attacked Gui'
  end
end

# As Player 1,
# So I can start to lose a game of Battle,
# I want Player 2's attack to reduce my HP by 10




# As two Players,
# So we can continue our game of Battle,
# We want to switch turns
