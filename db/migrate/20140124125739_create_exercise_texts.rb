class CreateExerciseTexts < ActiveRecord::Migration
  def change
    create_table :exercise_texts do |t|
      t.string :exercise_id
      t.string :text_id


      t.timestamps
    end

    add_index :exercise_texts, :exercise_id
    add_index :exercise_texts, :text_id
  end
end
