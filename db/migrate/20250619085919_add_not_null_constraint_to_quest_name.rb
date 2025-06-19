class AddNotNullConstraintToQuestName < ActiveRecord::Migration[8.0]
  def change
    change_column_null :quests, :name, false
  end
end
