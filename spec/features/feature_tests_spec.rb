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
    expect(page).to have_content 'Gui: 60HP'
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

feature 'Start to lose' do
  scenario 'reduces player HP' do
    sign_in_and_play
    click_button 'ATTACK'
    click_button 'OK'
    expect(page).to have_content 'Gui: 50HP'
  end
end

# As two Players,
# So we can continue our game of Battle,
# We want to switch turns

feature 'Switch turns' do

  context 'seeing the current turn' do
    scenario 'at the start of the game' do
      sign_in_and_play
      expect(page).to have_content "Callum's turn"
    end

    scenario 'after player 1 attacks' do
      sign_in_and_play
      click_button 'ATTACK'
      click_button 'OK'
      expect(page).not_to have_content "Callum's turn"
      expect(page).to have_content "Gui's turn"
    end
  end
end

# As Player 1,
# So I can see how close I am to losing,
# I want to see my own hit points

feature 'Hit Points' do
  scenario 'displaying hit points' do
    sign_in_and_play
    expect(page).to have_content 'Callum: 60HP'
  end
end

# As Player 1,
# So I can lose a game of Battle,
# I want Player 2 to attack me, and I want to get a confirmation

feature 'Attacking player' do
  scenario 'player 2 hits player 1' do
    sign_in_and_play
    click_button 'ATTACK'
    click_button 'OK'
    click_button 'ATTACK'
    expect(page).to have_content 'Gui attacked Callum'
  end
end


# As Player 1,
# So I can start to lose a game of Battle,
# I want Player 2's attack to reduce my HP

feature 'Start to lose' do
  scenario 'reduces player HP' do
    sign_in_and_play
    click_button 'ATTACK'
    click_button 'OK'
    click_button 'ATTACK'
    click_button 'OK'
    expect(page).not_to have_content 'Callum: 60HP'
    expect(page).to have_content 'Callum: 50HP'
  end
end
