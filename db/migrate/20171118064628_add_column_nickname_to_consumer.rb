class AddColumnNicknameToConsumer < ActiveRecord::Migration[5.1]
  def change
  	add_column :consumers, :nickname, :string, null: false, default: ""
  end
end
