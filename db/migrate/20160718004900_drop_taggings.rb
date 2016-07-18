class DropTaggings < ActiveRecord::Migration
  def up
  	drop_table :taggings
  end
end
