class Comment < ApplicationRecord
  belongs_to :post

  validates :commenter_name, presence: true
  validates :body, presence: true
end
