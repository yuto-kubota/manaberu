class AddIndex < ActiveRecord::Migration[5.2]
  def change
    add_index :parents, :email
    add_index :givings, :email
  end
end
