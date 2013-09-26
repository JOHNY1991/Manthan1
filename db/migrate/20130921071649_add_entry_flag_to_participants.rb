class AddEntryFlagToParticipants < ActiveRecord::Migration
  def change
    add_column :participants, :entry, :boolean
  end
end
