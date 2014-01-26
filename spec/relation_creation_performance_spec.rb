require 'spec_helper'

describe "Save new word" do
  let(:exercise) {build :exercise}
  let(:word) {build :word, exercise: exercise , body: "the"}
  let(:word1) {build :word, exercise: exercise , body: "the"}

  before do 
    exercise.save!

    1000.times do 
      create :text
    end

    word.save!
  end

  it "makes 10000 relations" do
    expect(exercise.texts).to eq Text.all
  end

  it "filters text by existing relations" do
    1000.times do 
      create :text
    end
    word1.save!
    expect(exercise.texts).to eq Text.all
  end
end

# 2000 = 21.7