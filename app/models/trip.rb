class Trip < ActiveRecord::Base
  attr_accessible :f_max_remb, :f_reason, :f_remb_amt, :f_remb_eligible, :pid, :r_max_remb, :r_reason, :r_remb_amt, :r_remb_eligible, :attending_status, :f_ticket, :r_ticket, :hotel
  self.primary_key= :pid

  belongs_to :participant , :foreign_key => "pid"
  #validates :f_remb_amt, numericality: { only_integer: true }
  #validates :r_remb_amt, numericality: { only_integer: true }

end
