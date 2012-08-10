Given /^a user visits the signin page$/ do
  visit signin_path
end

When /^he submits invalid signin information$/ do
	click_button 'Sign in'
end

Then /^he should see an error message$/ do
	page.should have_selector('div.alert.alert-error')
end

Given /^the user has an account$/ do
	@user = User.create(name: "cucumber user", email:"c@cc.com", password: "abcdef", password_confirmation: "abcdef")
end

Given /^the user submits valid signin information$/ do
	fill_in "Email", with: @user.email
	page.fill_in "Password", with: @user.password
	click_button('Sign in')
end

Then /^he should see his profile page$/ do
	page.should have_selector('h1', text: @user.name) 
end

Then /^he should see a signout link$/ do
	page.should have_link('Sign out')  
end