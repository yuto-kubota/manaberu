class Giving < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_secure_password
end
