Given(/^that user "([^"]*)" with password "([^"]*)" has logged in$/) do |username, password|

  user = User.create!(surname: 'test',
                      firstname: 'test',
                      email: 'test@aber.ac.uk',
                      phone: '00000 000000',
                      grad_year: 2000)
  UserDetail.create!(login: username,
                     password: password,
                     user: user)
  visit root_path
  click_button('Login')
  fill_in('login', :with => username)
  fill_in('password', :with => password)
  click_button('Log In')
  # now on home page
end

When(/^the admin user broadcasts "([^"]*)" to the notification feed$/) do |content|
  click_link('Broadcasts')
  click_link('New broadcast')
  fill_in('broadcast_content', :with => 'testing actioncable')
  uncheck('feeds_email')
  uncheck('feeds_facebook')
  uncheck('feeds_RSS')
  uncheck('feeds_atom')
  uncheck('feeds_twitter')
  click_button('Broadcast')
end

Then(/^the current page should contain the text: "([^"]*)"$/) do |text|
  page.has_content?(text)
end

Then(/^the current page should show the text "([^"]*)" in the notification feed$/) do |content|
  page.has_content?(content)
end

# Given that user "admin" with password "taliesin" has logged in
# When the admin user broadcasts "hello world" to the notification feed
# Then the current page should contain the text: "Broadcast was successfully saved and broadcast to all feeds"
# And the current page should show the text "hello world" in the notification feed