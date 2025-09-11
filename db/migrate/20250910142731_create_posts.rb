class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string  :name,    null: false
      t.text    :content, null: false
      t.integer :likes_count, null: false, default: 0
      t.timestamps
    end
  end
end

