class CreateLibraries < ActiveRecord::Migration[7.0]
  def change
    create_table :libraries do |t|
      t.references :county, null: false, foreign_key: true
      t.string :name
      t.string :address
      t.string :telephone

      t.timestamps
    end
  end
end
