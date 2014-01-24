class Exercise < ActiveRecord::Base
    has_many :texts, through: :exercise_texts
    has_many :exercise_texts
    has_many :words, dependent: :destroy
    validates :name, :description, presence: true
end
