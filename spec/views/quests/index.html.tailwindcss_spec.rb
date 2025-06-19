require 'rails_helper'

RSpec.describe "quests/index", type: :view do
  before(:each) do
    assign(:quests, [
      Quest.create!(
        name: "Name",
        status: false
      ),
      Quest.create!(
        name: "Name",
        status: false
      )
    ])
  end


end
