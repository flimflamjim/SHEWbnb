feature 'Creating a place' do

  let!(:user) do
    User.create(first_name: 'Bob',
                last_name: 'Smith',
                username: 'bob1',
                email: 'bob@me.com',
                password: 'minions',
                password_confirmation: 'minions'
                )
  end

  scenario 'When logged in I can add a place' do
    login(username: user.username, password: user.password)
    add_place
    expect(current_path).to eq '/places'
    expect(Place.first.user_id).to eq user.id

    within 'ul#places' do
      expect(page).to have_content('Downton Abbey')
      expect(page).to have_content('Start date: 2016-06-13')
    end
  end

end
