require 'spec_helper'

describe Category do
  it "should require a name" do
    should validate_presence_of :name
  end
  it "should require a description" do
    should validate_presence_of :description
  end
  it "should require a unique name" do
    should validate_uniqueness_of :name
  end
end
