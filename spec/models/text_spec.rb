require 'spec_helper'

describe Text do
  it "is valid with valid data" do
    expect(build :text).to be_valid
  end

  it "validates presence of name" do
    expect(build :text, body: "").not_to be_valid
  end

  let(:exercise) {create :exercise}
  let(:text) {create :text, body: "Something different"}
  let(:word) {create :word, exercise: exercise, body: "something"}

  describe "making relations" do

    before do
      text.exercises << exercise
    end

    it "returns text exercises" do
      expect(text.exercises).to eq [exercise]
    end

  end

  describe "Postgres full text search" do

    it "searchs text table" do
      expect(Text.search(word.body)).to eq [Text.find(text.id)]
    end

    it "tests edge cases" do 
      pending "Make edge cases tests"
    end
  end

end
