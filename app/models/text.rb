class Text < ActiveRecord::Base
  has_many :exercises, through: :exercise_texts
  has_many :exercise_texts
  validates :body, presence: true

  def self.search(word)
    conditions = <<-EOS
      to_tsvector('simple', body) @@ to_tsquery('simple', ?)
    EOS
    where(conditions, word)
  end
end
