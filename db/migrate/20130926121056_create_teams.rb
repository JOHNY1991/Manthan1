class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams, {:id => false} do |t|
      t.integer :team_id
      t.string :name
      t.string :college

      t.timestamps
    end

  end
end
