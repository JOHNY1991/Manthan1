class Participant < ActiveRecord::Base
  attr_accessible :age, :bcity, :college, :email, :fname, :gender, :lname, :phone, :pid, :teligible, :entry,:team_id

  belongs_to :team, :class_name => "Team", :foreign_key => "team_id"

end
