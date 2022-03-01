class CreateInsights < ActiveRecord::Migration[6.0]
  def change
    create_table :insights do |t|
      t.decimal :total_area, default: 0
      t.decimal :commercial_area, default: 0
      t.decimal :residential_area, default: 0
      t.decimal :common_area, default: 0
      t.string :insightable_type
      t.bigint :insightable_id

      t.timestamps
    end

    add_index :insights, [:insightable_type, :insightable_id]
  end
end
