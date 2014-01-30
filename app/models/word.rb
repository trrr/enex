class Word < ActiveRecord::Base
  belongs_to :exercise
  validates :exercise_id, :body, presence: true
  before_save :make_relations



  private 

    # Exclude any existing relations from the search,
    # if no relations exists make full table search.
    # TODO: Needs refactoring!
    def texts    
      if exercise_texts.any?
        Text.where("id NOT IN (?)", exercise_texts.map(&:id)).search(self.body)
      else
        Text.search(self.body)
      end
    end

    def make_relations
      texts.each  { |t| exercise_texts << t }
    end

    def exercise_texts
      self.exercise.texts
    end
end
