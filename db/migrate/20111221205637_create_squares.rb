class CreateSquares < ActiveRecord::Migration
  def change
    create_table :squares do |t|
      t.integer :x
      t.integer :y
      t.boolean :covered
      t.boolean :mined
      t.references :game

      t.timestamps
    end
  end
end
