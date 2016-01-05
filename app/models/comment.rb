class Comment < ActiveRecord::Base

  default_scope -> { order(created_at: :desc) }

  belongs_to :user
  belongs_to :micropost

  validates :comment_content, presence: true
  validates :user_id, presence: true
  validates :micropost_id, presence: true
end