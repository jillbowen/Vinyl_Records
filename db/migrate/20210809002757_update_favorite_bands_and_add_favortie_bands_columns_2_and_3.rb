class UpdateFavoriteBandsAndAddFavortieBandsColumns2And3 < ActiveRecord::Migration
  def change
    rename_column :users, :favorite_bands, :favorite_band_1
    add_column :users, :favorite_band_2, :string
    add_column :users, :favorite_band_3, :string
  end
end
