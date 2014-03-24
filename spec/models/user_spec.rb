require 'spec_helper'

describe User do

	before { @user = User.new(name: "Test one", email: "test@one.com",
			password: "foobar", password_confirmation: "foobar"
		) }

	subject { @user }

	it { should respond_to(:name) }
	it { should respond_to(:email) }
	it { should respond_to(:password_digest) }
	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }
	it { should respond_to(:authenticate) }

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

	describe "When password is empty" do
		before do
			@user = User.new(name: "A", email: "a@b.c", password: "", password_confirmation: "b")
		end
		it { should_not be_valid }
	end

	describe "Password should match passord confirmation" do
		before do
			@user.password_confirmation = "mismatch"
		end
		it { should_not be_valid }
	end

	describe "password too short" do
		before { @user.password = @user.password_confirmation = "a" * 5 }
		it { should be_invalid }
	end

	describe "return value of authenticate method" do
		before { @user.save }
		let(:saved_user) { User.find_by(email: @user.email) }

		describe "when password match" do
			it { should eq saved_user.authenticate(@user.password) }
		end

		describe "when invalid password" do
			let(:user_with_invalid_password) { saved_user.authenticate("invalid") }
			it { should_not eq user_with_invalid_password }
			specify { expect(user_with_invalid_password).to be_false }
		end
	end

end
