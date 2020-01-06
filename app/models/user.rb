class User < ApplicationRecord
  has_one_attached :image
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  has_secure_password

  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def display_image
    image.variant(resize_to_limit: [100, 100])
  end

  def display_avatar
    image.variant(resize_to_limit: [200, 200])
  end

  def forget
    update_attribute(:remember_digest, nil  )
  end
end
