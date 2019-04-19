def sign_in_and_play
  visit('/')
  fill_in 'player_1', with: 'Sarpong'
  fill_in 'player_2', with: 'Gui'
  click_button 'Battle!'
end

def attack
  click_button('left')
end
