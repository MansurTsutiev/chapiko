class CreateBlocks < ActiveRecord::Migration[7.0]
  def change
    create_table :blocks do |t|
      t.string :link
      t.integer :likes
      t.integer :dislikes
      t.integer :maybies

      t.timestamps
    end
  end
end
