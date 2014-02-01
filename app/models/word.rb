class Word < ActiveRecord::Base
  belongs_to :exercise
  validates :exercise_id, :body, presence: true
  before_save :make_relations



  private 

    def make_relations
      new_texts.each  { |t| exercise_texts << t }
    end

    def exercise_texts
      self.exercise.texts
    end

    def new_texts    
      new_texts = Text.where.not(id: exercise_texts.map(&:id)) ||  Text.all
      search_in_texts(new_texts)
    end

    def search_in_texts(array_of_texts)
      array_of_texts.search(self.body)
    end

end
