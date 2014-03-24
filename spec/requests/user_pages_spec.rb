require 'spec_helper'
include ApplicationHelper

describe "UserPages" do

subject { page }

  describe "signup page" do
  	before { visit signup_path }

  	it { should have_content "Sign Up" }
  	it { should have_title(full_title('Sign up'))}
  end

  describe "user profile page" do
  	let(:user) { FactoryGirl.create(:user) }
  	before { visit user_path(user) }

  	it { should have_content(user.name) }
  	it { should have_title(user.name) }
  end

end
