require 'spec_helper'

describe Word do

  let(:exercise) {create :exercise}
  let(:text) {create :text}
  let(:word) {create :word, exercise: exercise}
  let(:text1) {create :text, body: "the antler"}
  let(:word1) {create :word, exercise: exercise, body: "ant"}

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

    before { exercise.reload; text.reload; word.reload }

    it "creates connection on word added" do
      expect(exercise.texts).to eq [text]
    end

    it "doesn't create connection if text doesn't contain a given word" do
      word1.reload
      expect(exercise.texts).to eq [text]
    end

  end
end
