require 'spec_helper'
include ApplicationHelper

describe "UserPages" do

subject { page }

  describe "signup page" do
  	before { visit signup_path }
    let(:submit) { "Create my account" }

  	it { should have_content "Sign Up" }
  	it { should have_title(full_title('Sign up'))}

    describe "With incomplete information" do
      it "should not create a user" do
        fill_in "Name", with: "Emample User"
        expect { click_button submit }.not_to change(User, :count)
      end
    end
    # The above expect is short for this
    # initial = User.count
    # click_button "Create my account"
    # final = User.count
    # expect(initial).to eq final

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end
      it "should create a new user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end

  end

  describe "user profile page" do
  	let(:user) { FactoryGirl.create(:user) }
  	before { visit user_path(user) }

  	it { should have_content(user.name) }
  	it { should have_title(user.name) }
  end

end
