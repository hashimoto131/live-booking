class AddReceverIdToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :recever_id, :integer
  end
end
