require 'rails_helper'

RSpec.describe "quests/edit", type: :view do
  let(:quest) {
    Quest.create!(
      name: "MyString",
      status: false
    )
  }

  before(:each) do
    assign(:quest, quest)
  end
end
