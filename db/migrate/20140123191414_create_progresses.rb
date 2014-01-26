class CreateProgresses < ActiveRecord::Migration
  def change
    create_table :progresses do |t|
      t.integer :user_id
      t.integer :exercise_id
      t.integer :position

      t.timestamps
    end
  end
end
