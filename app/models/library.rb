class Library < ApplicationRecord
  belongs_to :county
  has_and_belongs_to_many :books
end
