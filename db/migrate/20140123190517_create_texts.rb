class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|
      t.text :body

      t.timestamps
    end

    create_table :exercises_texts do |t|
      t.string :exercise_id
      t.string :text_id
    end
  end
end
