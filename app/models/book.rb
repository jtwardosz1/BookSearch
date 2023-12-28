class Book < ApplicationRecord
    # Validation for isbn format reg expression was found in MSU Denver discord
    has_and_belongs_to_many :libraries
    belongs_to :person
    validates :title, presence: true
    validates :isbn, presence: true, uniqueness: true
    validates :person, presence: true
    validates_format_of :isbn, with: /\AISBN \d{3}-\d-\d{3}-\d{5}-\d\z/, 
    message: "Must be official ISBN Format: ISBN 000-0-000-00000-0"
end
