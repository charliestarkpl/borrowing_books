class Comment < ApplicationRecord
  has_ancestry

  belongs_to :commentable, polymorphic: true
  belongs_to :user

  validates :commentable_id, :commentable_type, presence: true
  validates :body, presence: true
end
