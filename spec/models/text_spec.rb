require 'spec_helper'

describe Text do
  it "is valid with valid data" do
    expect(build :text).to be_valid
  end

  it "validates presence of name" do
    expect(build :text, body: "").not_to be_valid
  end

  describe "making relations" do
    let(:exercise) {build :exercise}
    let(:text) {build :text}

    before do
      text.exercises << exercise
    end

    it "returns text exercises" do
      expect(text.exercises).to eq [exercise]
    end
  end
end
