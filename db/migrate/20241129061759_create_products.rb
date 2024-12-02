class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.float :price
      t.string :category
      t.string :image
      t.jsonb :rating
      t.timestamps
    end
  end
end
