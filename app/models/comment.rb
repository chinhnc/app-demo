class Comment < ActiveRecord::Base

  default_scope -> { order(created_at: :desc) }

  belongs_to :user
  belongs_to :micropost

  mount_uploader :pictute, PictureUploader

  validates :comment_content, presence: true
  validates :user_id, presence: true
  validates :micropost_id, presence: true
  validate :picture_size

  private

    def picture_size
      if pictute.size > 5.megabytes
        error.add(:pictute, "should be less than 5MB")
      end
    end
end
