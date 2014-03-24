require 'spec_helper'

describe User do

	before { @user = User.new(name: "Test one", email: "test@one.com") }

	subject { @user }

	it { should respond_to(:name) }
	it { should respond_to(:email) }
	it { should respond_to(:password_digest) }

	it { should be_valid }

	describe "When name is not present" do
		before { @user.name = "" }
		it { should_not be_valid }
	end

	describe "When email is not present" do
		before { @user.email = "" }
		it { should_not be_valid }
	end

	describe "When name is too long" do
		before { @user.name = "a" * 101 }
		it { should_not be_valid }
	end

	describe "When email is not valid" do
		it "should be invalid" do
			addresses = %w[foo foo@ foo@bar foo@bar, user_at_foo.org foo@bar+baz.com]
			addresses.each do |invalid_address|
				@user.email  = invalid_address
				expect(@user).to be_invalid
			end
		end
	end

	describe "When email is valid" do
		it "should be valid" do
			addresses = %w[foo@bar.com foo@bar.co.nz foo1a@bar.in user@foo.org foo@barbaz.com]
			addresses.each do |invalid_address|
				@user.email  = invalid_address
				expect(@user).to be_valid
			end
		end
	end

	describe "When email address is already used" do
		before do
			duplicate_user = @user.dup
			duplicate_user.email = @user.email.upcase
			puts duplicate_user.email
			duplicate_user.save
		end
		it { should_not be_valid }
	end

	describe "email should be saved as lower case" do
		let(:mixed_case_email) { "Foo@EXample.coM" }
		it "should be saved as all lower case" do
			@user.email = mixed_case_email
			@user.save
			expect(@user.reload.email).to eq mixed_case_email.downcase
		end

	end

end
