class Child < ApplicationRecord
  validates :name, presence: true
  validates :parent_id, presence: true
  has_secure_password
  belongs_to :parent
end
