def sign_up(first_name: 'Bob',
            last_name: 'Smith',
            username: 'bob1',
            email: 'bob@me.com',
            password: 'minions',
            password_confirmation: 'minions')
  visit '/users/new'
  expect(page.status_code).to eq 200
  fill_in :first_name,  with: first_name
  fill_in :last_name,   with: last_name
  fill_in :username,    with: username
  fill_in :email,       with: email
  fill_in :password,    with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up'
end

def login(username:, password:)
  visit 'sessions/new'
  expect(page.status_code).to eq 200
  fill_in :username, with: username
  fill_in :password, with: password
  click_button 'Login'
end

# def add_place(name:, description:, price:)
#   visit '/places'
#   click_button 'Add new place'
#   fill_in :name, with: name
#   fill_in :description, with: description
#   fill_in :price, with: price
#   click_button 'Add Place'
# end

def sign_up_guest(first_name: 'Hanna',
            last_name: 'Smith',
            username: 'Hanna1',
            email: 'Hanna@me.com',
            password: 'hanhan',
            password_confirmation: 'hanhan')
  visit '/users/new'
  expect(page.status_code).to eq 200
  fill_in :first_name,  with: first_name
  fill_in :last_name,   with: last_name
  fill_in :username,    with: username
  fill_in :email,       with: email
  fill_in :password,    with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up'
end

def add_place
  visit '/places/new'
  fill_in 'name', with: 'Downton Abbey'
  fill_in 'description', with: 'Charming Victorian manor house'
  fill_in 'price', with: '29'
  click_button 'Add Place'
end
