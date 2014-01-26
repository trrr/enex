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

  describe "#includes?" do

    it "returns true if the body includes given word" do
      expect(text.includes?(word)).to be_true
    end

    it "returns true if the body includes given word (through postgres search)" do
      pending "Write postgres search"
      # expect(Text.search(word.body)).to eq word.body
    end

    it "tests edge cases" do 
      pending "Make edge cases tests"
    end
  end

end
