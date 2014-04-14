require 'spec_helper'

describe "User" do

	context "Validations" do

		let(:user) {User.create(id: 1, username: "khush123",
		 email: "kush@kush.com", password: "12345678",
		  password_confirmation: "12345678") }

		subject { user }

		describe "#username.nil?" do
			before { user.username = nil }
			it { should_not be_valid }
		end

		describe "#username not unique" do
			before { User.create(id: 2, username: "khush123",
		 email: "kush@me.com", password: "12345678",
		  password_confirmation: "12345678")}
		  it {should_not be_valid }
		end

		describe "#email" do
			before { user.email = nil  }
			it { should_not be_valid }
		end
	end
end
