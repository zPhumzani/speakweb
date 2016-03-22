class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, limit: 50
      t.string :last_name, limit: 50
      t.string :email, limit: 100
      t.string :password_digest
      t.boolean :admin, default: false
      t.string :slug

      t.timestamps null: false
    end
    add_index :users, :email, unique: true
  end
end
