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
  it "should require a unique name" do
    should validate_uniqueness_of :name
  end
  it "should set the author flag when uploadind creating a mod" do
    user = Fabricate :user
    user.author.should eql false
    mod = Fabricate :mod, user: user
    user.author.should eql true
  end
  it "should set the author flag when uploadind creating a mod" do
    user = Fabricate :user
    user.author.should eql false
    pack = Fabricate :pack, user: user
    user.author.should eql true
  end
end
