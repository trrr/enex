class Exercise < ActiveRecord::Base
    has_and_belongs_to_many :texts
    has_many :lookups
    has_many :words
    validates :name, :description, presence: true
end
