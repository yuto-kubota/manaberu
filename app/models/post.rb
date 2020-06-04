class Post < ApplicationRecord
  validates :content, presence: true
  validates :name, presence: true
  validates :youtube_url, presence: true
  validates :giving_id, presence: true
  has_many :fins, dependent: :destroy
  belongs_to :giving

  def finished?(child)
      fins.where(child_id: child.id).exists?
  end
end
