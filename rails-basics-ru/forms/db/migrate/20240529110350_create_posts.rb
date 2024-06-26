class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.string :summary
      t.boolean :published, default: false, null: false

      t.timestamps
    end
  end
end
