class Reading < ApplicationRecord
  belongs_to :user
  belongs_to :book
  belongs_to :book_club
end
