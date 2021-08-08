class AddFavoriteBandsToUserTable < ActiveRecord::Migration
  def change
    add_column :users, :favorite_bands, :string
  end
end
