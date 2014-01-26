class Word < ActiveRecord::Base
  belongs_to :exercise
  validates :exercise_id, :body, presence: true
  before_save :make_relations

    def texts
      Text.where("id NOT IN (?)", self.exercise.texts.map(&:id))
    end

  private 

    # Create relation Excersice << Text if Text includes this word. 
    # Now we can do exercise.texts and get all texts with exersice words.
    def make_relations
      #TODO: refactor that crap
      if texts != []
        search_through_texts_and_make_relation(texts)
      elsif texts == [] && self.exercise.texts == []
        search_through_texts_and_make_relation(Text.all)
      else
        return
      end
    end

    def search_through_texts_and_make_relation(texts)
      texts.each do |t|
        self.exercise.texts << t if t.includes?(self)
      end
    end
end
