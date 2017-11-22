class AddConsumerIdToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :consumer_id, :integer
  end
end