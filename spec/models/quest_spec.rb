require 'rails_helper'

RSpec.describe Quest, type: :model do
  it "is invalid without a name" do
    quest = Quest.new(name: nil)
    expect(quest).not_to be_valid
    expect(quest.errors[:name]).to include("can't be blank")
  end

  it "is valid with a name" do
    quest = Quest.new(name: "My Quest")
    expect(quest).to be_valid
  end
end
