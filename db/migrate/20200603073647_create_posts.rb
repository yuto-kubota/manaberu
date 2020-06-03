class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :content
      t.string :youtube_url
      t.integer :giving_id

      t.timestamps
    end
  end
end
