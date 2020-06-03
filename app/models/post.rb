class Post < ApplicationRecord
  has_many :fins, dependent: :destroy
  belongs_to :giving

  def finished?(child)
      fins.where(child_id: child.id).exists?
  end
end
