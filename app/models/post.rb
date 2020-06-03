class Post < ApplicationRecord
  has_many :fins
  belongs_to :giving

  def finished?(child)
      fins.where(child_id: child.id).exists?
  end
end
