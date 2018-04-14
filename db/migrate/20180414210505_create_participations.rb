class CreateParticipations < ActiveRecord::Migration[5.2]
  def change
    create_table :participations do |t|
      t.references :team, foreign_key: true
      t.references :tournament, foreign_key: true

      t.timestamps
    end

    add_index :participations, [:team_id, :tournament_id], unique: true
  end
end
