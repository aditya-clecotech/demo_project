class CreateSubscriptions < ActiveRecord::Migration[7.1]
  def change
    create_table :subscriptions do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :posts_allowed
      t.string :stripe_price_id
      t.boolean :active

      t.timestamps
    end
  end
end
