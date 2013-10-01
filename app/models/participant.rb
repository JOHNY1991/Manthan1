class Participant < ActiveRecord::Base
  attr_accessible :age, :bcity, :college, :email, :fname, :gender, :lname, :phone, :pid, :teligible, :entry,:team_id
  set_primary_key :pid
  belongs_to :team, :class_name => "Team", :foreign_key => "team_id"
  has_one :trip, :foreign_key => "pid"

end
