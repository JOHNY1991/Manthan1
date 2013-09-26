class AddReceiverColumnToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :receiver, :string
  end
end
