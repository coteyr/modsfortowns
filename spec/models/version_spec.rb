require 'spec_helper'

describe Version do
  it "should require a version" do
    should validate_presence_of :number
  end
  it "should require a mod" do
    should validate_presence_of :mod_id
  end
  it "should require a change" do
    should validate_presence_of :major_changes
  end
  it "should require a download" do
    should validate_presence_of :download
  end
end
