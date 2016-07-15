class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :lyrics
      t.string :origin
      t.string :image

      t.timestamps null: false
    end
  end
end
