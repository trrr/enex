require 'spec_helper'

describe Progress do
  let(:user) {build :user}
  let(:progress) {build :progress, user: user}

  before {user.save!}

  it "is valid with valid data" do
    expect(progress).to be_valid
  end
end
