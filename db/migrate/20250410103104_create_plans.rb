class CreatePlans < ActiveRecord::Migration[7.1]
  def change
    create_table :plans do |t|
      t.string :name
      t.string :stripe_product_id
      t.string :stripe_price_id
      t.integer :posts_allowed
      t.integer :price_in_rupees

      t.timestamps
    end
  end
end
