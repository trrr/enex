require 'spec_helper'

describe Exercise do

  it "is valid " do
    expect(build(:exercise)).to be_valid
  end

  it "validates presence of name" do
    expect(build(:exercise, name: "")).not_to be_valid
  end

  it "validates presence of description" do
    expect(build(:exercise, description: "")).not_to be_valid
  end

end
