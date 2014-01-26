class Text < ActiveRecord::Base
  has_many :exercises, through: :exercise_texts
  has_many :exercise_texts
  validates :body, presence: true

  def search(word)
    self.body.downcase.include? word.body.downcase
  end
end
