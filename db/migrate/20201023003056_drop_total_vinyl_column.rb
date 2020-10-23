class DropTotalVinylColumn < ActiveRecord::Migration
  def change
    remove_column :vinyls, :total_vinyl
  end
end
