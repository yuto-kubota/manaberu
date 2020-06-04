class Giving < ApplicationRecord
  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 100 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  has_many :posts, dependent: :destroy
  has_secure_password
  has_one_attached :avatar

  def giving_avatar
    avatar.variant(combine_options: { resize: '40x40^', crop: '40x40+0+0', gravity: :center }).processed
  end
end
