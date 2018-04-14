class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :email
      t.string :nick
      t.string :uuid

      t.timestamps
    end

    add_index :users, :provider
    add_index :users, :uid
    add_index :users, [:uid, :provider], unique: true
  end
end
