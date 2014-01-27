require 'spec_helper'

#NOTE: This spec doesn't make much sense now as we use postgres search with indexes.
#Left for future tests

describe "Save new word" do
  let(:exercise) {build :exercise}
  let(:word) {build :word, exercise: exercise , body: "the"}
  let(:word1) {build :word, exercise: exercise , body: "the"}

  before do 
    exercise.save!

    10.times do 
      create :text
    end

    word.save!
  end

  it "makes 10000 relations" do
    expect(exercise.texts).to eq Text.all
  end

  it "filters text by existing relations" do
    10.times do 
      create :text
    end
    word1.save!
    expect(exercise.texts).to eq Text.all
  end
end
