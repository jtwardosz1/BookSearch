class County < ApplicationRecord
    has_many :libraries , dependent: :destroy
end
