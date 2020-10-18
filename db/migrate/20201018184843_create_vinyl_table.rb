class CreateVinylTable < ActiveRecord::Migration
  def change
    create_table :vinyls do |t|
      t.string :album_name
      t.string :artist_name
      t.integer :vinyl_condition
      t.integer :total_vinyl
    end 
  end
end
