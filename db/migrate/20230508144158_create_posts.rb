class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.text :content
      t.integer :user_id
      t.text :link

      t.timestamps
    end
  end
end
