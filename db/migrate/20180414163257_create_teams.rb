class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name, null: false, unique: true
      t.string :logo
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
