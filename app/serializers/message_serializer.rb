class MessageSerializer < ActiveModel::Serializer
  attributes :id, :content
  has_one :user
  has_one :book_club
end
