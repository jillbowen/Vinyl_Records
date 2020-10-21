class AddUserIdToVinylTable < ActiveRecord::Migration
  def change
    add_column :vinyls, :user_id, :integer
  end
end
