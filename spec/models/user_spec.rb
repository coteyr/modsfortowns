describe User do
  it "should have the same login and password" do
    @user = User.new
    @user.email = "test@email.com"
    @user.login.should eql "test@email.com"
    @user.login = "test2@email.com"
    @user.email.should eql "test2@email.com"
  end
end
