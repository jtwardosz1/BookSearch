class CreateBooksLibraries < ActiveRecord::Migration[7.0]
  def change
    create_table :books_libraries do |t|
      t.references :book, null: false, foreign_key: true
      t.references :library, null: false, foreign_key: true

      t.timestamps
    end
  end
end
