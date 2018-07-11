class Post < ApplicationRecord
  belongs_to :user
  validates :title, length: {minimum: 10},
                    presence: true
  validates :body, length: {minimum: 20},
                    presence: true
end
