class Participant < ActiveRecord::Base
  attr_accessible :age, :bcity, :college, :email, :fname, :gender, :lname, :phone, :pid, :teligible, :entry,:team_id
end
