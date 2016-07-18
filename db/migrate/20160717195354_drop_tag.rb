class DropTag < ActiveRecord::Migration
  def up
    drop_table :tag
  end

end
