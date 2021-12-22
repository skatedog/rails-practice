class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name
      t.date :published_on
      t.integer :price

      t.timestamps
    end
  end
end
