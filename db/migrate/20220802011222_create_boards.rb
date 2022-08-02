class CreateBoards < ActiveRecord::Migration[7.0]
  def change
    create_table :boards do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.string :background_color
      t.string :background_photo

      t.timestamps
    end
  end
end
