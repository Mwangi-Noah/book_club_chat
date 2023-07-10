class Book < ApplicationRecord
    has_many :readings
    has_many :book_clubs, through: :readings
    has_many :users, through: :readings
end
