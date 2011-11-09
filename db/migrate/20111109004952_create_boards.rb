class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :name
      t.integer :x
      t.integer :y
      t.integer :mines

      t.timestamps
    end
  end
end
