class PostAddNameFin < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :name, :string
    add_column :posts, :fin, :integer
  end
end
