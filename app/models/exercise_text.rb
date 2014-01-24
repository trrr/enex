class ExerciseText < ActiveRecord::Base
  belongs_to :exercise
  belongs_to :text
  validates :text_id, :uniqueness => { :scope => :exercise_id }
end
