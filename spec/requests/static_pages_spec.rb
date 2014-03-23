require 'spec_helper'

describe "StaticPages" do

  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_content('Sample App') }
    it { should have_title('BidHelper') }
    it { should_not have_title(' | Home') }
  end

  describe "Help page" do
    before { visit help_path}
    it { should have_content('Help') }
  end

  describe "About page" do
    before { visit about_path }
    it { should have_content('About') }
  end

  describe "Contact page" do
    before { visit contact_path }
  	it "should have the content 'Contact'" do
  		visit contact_path
  		expect(page).to have_content('Contact')
  	end

  	it "should have the title 'Contact" do
  		visit contact_path
  		expect(page).to have_title('Contact')
  	end

  end

end
