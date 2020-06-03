class Child < ApplicationRecord
  validates :name, presence: true
  validates :parent_id, presence: true
  has_secure_password
  has_one_attached :avatar
  belongs_to :parent

  def icon_avatar
    # avatar.variant(resize: '40x40').processed
    avatar.variant(combine_options: { resize: '40x40^', crop: '40x40+0+0', gravity: :center }).processed
  end
end
