class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name, limit: 20

      t.timestamps null: false
    end
    add_index :tags, :name
  end
end
