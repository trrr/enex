require 'spec_helper'

describe Word do

  let(:exercise) {build :exercise}
  let(:text) {build :text}
  let(:word) {build :word, exercise: exercise}
  let(:word1) {build :word, exercise: exercise, body: "ant"}
  let(:text1) {build :text, body: "the ant"}

  before do
    exercise.save!
    text.save!
    word.save!
  end

  describe "validations" do
    it "is valid with valid data" do
      expect(word).to be_valid
    end

    it "validates presence of body" do
      expect(build :word, body: "").not_to be_valid
    end


    it "validates presence of exercise_id" do
      expect(build :word, exercise: nil).not_to be_valid
    end

  end

  describe "making relations" do

    it "returns text exercises" do
      expect(word.exercise).to eq exercise
    end
  end

  describe "creating connections" do

    it { pending "Needs refactoring. Baadly."}

    it "creates connection on word added" do
      expect(exercise.texts).to eq [text]
    end

    it "doesn't search through already connected texts" do
      text1.save!
      word1.save!
      expect(exercise.texts).to eq [text, text1]
    end

    it "works fast enough" do
      100.times do 
        create :text
      end

      exercise1 = build :exercise
      exercise1.save!
      word3 = build :word, exercise: exercise1 , body: "the"
      word3.save!
      expect(exercise1.texts).to eq Text.all
    end

  end
end
