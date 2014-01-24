require 'spec_helper'

describe Word do

  let(:exercise) {build :exercise}
  let(:word) {build :word, exercise: exercise}

  before { exercise.save! }

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
end
