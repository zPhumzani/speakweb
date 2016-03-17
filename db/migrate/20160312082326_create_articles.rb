class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.references :user, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
      t.string :title, limit: 200
      t.text :body
      t.string :filename
      t.string :content_type
      t.binary :file_contents
      t.boolean :publish, default: false
      t.string :slug, limit: 50

      t.timestamps null: false
    end
    add_index :articles, :slug, unique: true
  end
end
