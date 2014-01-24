class CreateProgresses < ActiveRecord::Migration
  def change
    create_table :progresses do |t|
      t.string :user_id
      t.string :exercise_id
      t.string :position

      t.timestamps
    end
  end
end
