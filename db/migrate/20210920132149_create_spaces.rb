class CreateSpaces < ActiveRecord::Migration[6.0]
  def change
    create_table :spaces do |t|
      t.string :name, null: false
      t.integer :space_type, null: false, default: 0
      t.references :site, null: false, foreign_key: true

      t.timestamps
    end

    add_index :spaces, :space_type
  end
end
