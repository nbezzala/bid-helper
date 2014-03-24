require 'spec_helper'

describe User do

	before { @user = User.new(name: "Test one", email: "test@one.com") }

	subject { @user }

	it { should respond_to(:name) }
	it { should respond_to(:email) }

end
