class CreateChildren < ActiveRecord::Migration[5.2]
  def change
    create_table :children do |t|
      t.string :name
      t.string :password_digest
      t.integer :parent_id

      t.timestamps
    end
  end
end
