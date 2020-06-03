class CreateFins < ActiveRecord::Migration[5.2]
  def change
    create_table :fins do |t|
      t.integer :child_id
      t.integer :post_id

      t.timestamps
    end
  end
end
