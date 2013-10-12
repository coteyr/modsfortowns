require 'spec_helper'
describe User do
  it "should have the same login and password" do
    @user = User.new
    @user.email = "test@email.com"
    @user.login.should eql "test@email.com"
    @user.login = "test2@email.com"
    @user.email.should eql "test2@email.com"
  end
  it "should require a name" do
    should validate_presence_of :name
  end
end