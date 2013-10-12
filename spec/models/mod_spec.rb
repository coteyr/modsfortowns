require 'spec_helper'

describe Mod do
  it "should require a name" do
    should validate_presence_of :name
  end
  it "should require a description" do
    should validate_presence_of :description
  end
  it "should require a unique name" do
    should validate_uniqueness_of :name
  end
  it "should require a user" do
    should validate_presence_of :user_id
  end
  it "should contain the last version" do
    @version = Fabricate :version
    @version = Fabricate :version
    @mod = @version.mod
    @mod.last_version.should eql @version
  end
  it "should require a screenshot" do
    should validate_presence_of :screenshot
  end
end
