class BookClub < ApplicationRecord
    has_many :memberships
    has_many :users, through: :memberships
    has_many :readings
    has_many :books, through: :readings
    has_many :messages
end
