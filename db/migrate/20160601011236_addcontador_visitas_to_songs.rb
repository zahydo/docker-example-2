class AddcontadorVisitasToSongs < ActiveRecord::Migration
  def change
  	add_column :songs, :contador_visitas, :integer
  end
end
