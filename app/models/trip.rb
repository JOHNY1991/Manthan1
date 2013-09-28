class Trip < ActiveRecord::Base
  attr_accessible :f_max_remb, :f_reason, :f_remb_amt, :f_remb_eligible, :pid, :r_max_remb, :r_reason, :r_remb_amt, :r_remb_eligible
  set_primary_key :pid

  belongs_to :participant


end
