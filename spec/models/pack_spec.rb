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
  it "should require a screenshot on pack" do
    Fabricate :pack
    should validate_presence_of :screenshot
  end
  it "should require a status" do
    should validate_presence_of :status
  end
  it "should require a valid status" do
    should ensure_inclusion_of(:status).in_array(%w[Concept Developement Complete Inactive])
  end
  it "should have a tag that is the name plus author" do
    pack = Fabricate :pack
    pack.tag.should eql "#{pack.title} by #{pack.user.name}"
  end
end
