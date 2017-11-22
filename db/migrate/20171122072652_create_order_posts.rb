class CreateOrderPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :order_posts do |t|
      t.integer :post_id
      t.integer :consumer_id

      t.timestamps
    end
  end
end
