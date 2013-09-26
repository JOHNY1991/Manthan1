class Team < ActiveRecord::Base
  attr_accessible :college, :name, :team_id
  set_primary_key :team_id
  has_many :participants , :class_name => "Participant"

end
