class AddFriskToParticipants < ActiveRecord::Migration
  def change
    add_column :participants, :frisk, :string
  end
end
