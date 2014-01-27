class Word < ActiveRecord::Base
  belongs_to :exercise
  validates :exercise_id, :body, presence: true
  before_save :make_relations

  def texts
    # Exclude any existing relations if any, else full table search.
    if self.exercise.texts.count > 0
      Text.where("id NOT IN (?)", self.exercise.texts.map(&:id)).search(self.body)
    else
      Text.search(self.body)
    end
  end

  private 

    def make_relations
      texts.each  { |t| self.exercise.texts << t }
    end
end
