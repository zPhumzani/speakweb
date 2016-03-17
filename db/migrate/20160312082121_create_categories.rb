class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, limit: 20
      t.string :slug, limit: 20

      t.timestamps null: false
    end
    add_index :categories, :name, unique: true
    add_index :categories, :slug, unique: true
  end
end
