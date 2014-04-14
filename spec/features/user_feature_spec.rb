require 'spec_helper'

describe User do



  context "Sign up" do
    it "should be possible to sign up username" do
      login_as_test_user
      expect(page).to have_content "successfully"
    end
  end
end
