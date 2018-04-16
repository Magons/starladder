class AddIndexToParticipants < ActiveRecord::Migration[5.2]
  def change
    add_index :participations, [:tournament_id, :team_id], unique: true
  end
end
