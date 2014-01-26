require 'spec_helper'

describe Text do
  it "is valid with valid data" do
    expect(build :text).to be_valid
  end

  it "validates presence of name" do
    expect(build :text, body: "").not_to be_valid
  end

  let(:exercise) {build :exercise}
  let(:text) {build :text}
  let(:word) {build :word, exercise: exercise}

  describe "making relations" do

    before do
      text.exercises << exercise
    end

    it "returns text exercises" do
      expect(text.exercises).to eq [exercise]
    end

  end

  describe "#search" do

    it "searchs for a word in the body" do
      expect(text.search(word)).to be_true
    end

    it "tests edge cases" do 
      pending "Make edge cases tests"
    end
  end

end
