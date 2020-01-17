class Micropost < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validates :images, content_type: { in: %w[image/jpeg image/gif image/png],
    message: "must be a valid image format"
  }, size: {
      less_than: 5.megabytes,
      message: "should be less than 5MB"
    }

  #  def display_micropost_image input
  #    return self.images[input].variant(resize_to_limit: [500, 500])
  #  end
end
