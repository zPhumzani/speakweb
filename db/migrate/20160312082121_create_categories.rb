class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, limit: 20
      t.string :slug

      t.timestamps null: false
    end
    add_index :categories, :name, unique: true
  end
end
