require 'spec_helper'

describe Text do
  it "is valid with valid data" do
    expect(create :text).to be_valid
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

    before { text.reload }

    it "searches text table" do
      expect(Text.search(word.body)).to eq [text]
    end

    it "doens't return true if only part of the word is given" do
      expect(Text.search("somethin")).to eq []
    end

    it "is case insensitive" do
      expect(Text.search(word.body.upcase)).to eq [text]
    end
    
  end

end
