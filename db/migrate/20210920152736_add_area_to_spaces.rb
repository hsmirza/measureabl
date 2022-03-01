class AddAreaToSpaces < ActiveRecord::Migration[6.0]
  def change
    add_column :spaces, :area, :decimal, default: 0
  end
end
