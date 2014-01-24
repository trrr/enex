class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.integer :exercise_id
      t.string :body

      t.timestamps
    end
  end
end
