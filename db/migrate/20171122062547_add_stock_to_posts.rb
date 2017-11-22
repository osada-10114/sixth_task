class AddStockToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :stock, :integer
  end
end
