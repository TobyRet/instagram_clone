require 'spec_helper'

describe User do



  context "Sign up" do
    it "should be possible to sign up username" do
      visit '/users/sign_up'
      fill_in 'Username', with 'test'
      fill_in 'Email', with 'test@test.com'
      fill_in 'Password', with '12345678'
      fill_in 'Password confirmation', with '12345678'
      click_button 'Sign up'
      expect(page).to have_content 'Successful'

    end

    it "should return an error if an incorrect login is entered during sign in" do
    end
  end
end
