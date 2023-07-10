class User < ApplicationRecord
  has_many :memberships
  has_many :book_clubs, through: :memberships
  has_many :readings
  has_many :books, through: :readings
  has_many :messages
end
