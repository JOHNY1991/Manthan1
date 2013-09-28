class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.integer :pid
      t.string :f_remb_eligible
      t.string :f_reason
      t.integer :f_max_remb
      t.integer :f_remb_amt
      t.string :r_remb_eligible
      t.string :r_reason
      t.integer :r_max_remb
      t.integer :r_remb_amt

      t.timestamps
    end
  end
end
