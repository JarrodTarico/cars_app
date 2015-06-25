class CreatePostParts < ActiveRecord::Migration
  def change
    create_table :post_parts do |t|
      t.string :heading
      t.text :body
      t.decimal :price
      t.string :neighborhood
      t.string :external_url
      t.string :timestamp

      t.timestamps null: false
    end
  end
end
