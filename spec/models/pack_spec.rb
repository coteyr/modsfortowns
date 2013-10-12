require 'spec_helper'

describe Pack do
  it "should require a name" do
    should validate_presence_of :title
  end
  it "should require a user_id" do
    should validate_presence_of :user_id
  end
  it "should require a unique name" do
    should validate_uniqueness_of :title
  end
end
