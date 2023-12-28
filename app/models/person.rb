class Person < ApplicationRecord
    has_many :book , dependent: :destroy

    def to_s
        name
      end
    end
