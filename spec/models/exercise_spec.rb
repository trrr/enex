require 'spec_helper'

describe Exercise do

  it "is valid with valid data" do
    expect(create :exercise).to be_valid
  end

  it "validates presence of name" do
    expect(build :exercise, name: "").not_to be_valid
  end

  it "validates presence of description" do
    expect(build :exercise, description: "").not_to be_valid
  end

  describe "making relations" do
    let(:exercise) {create :exercise}
    let(:text) {create :text}
    let(:word) {create :word, exercise: exercise}

    before do
      exercise.texts << text
    end

    it "returns exercise texts" do
      expect(exercise.texts).to eq [text]
    end

    it "doesn't save relation twice" do
      expect{
        exercise.texts << text
        }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "returns exercise words" do
      expect(exercise.words).to eq [word]
    end
  end
end
