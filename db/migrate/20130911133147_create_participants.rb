class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.integer :pid
      t.string :college
      t.string :fname
      t.string :lname
      t.string :email
      t.integer :phone
      t.integer :age
      t.string :gender
      t.string :bcity
      t.integer :teligible

      t.timestamps
    end
  end
end
