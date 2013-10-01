# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

#CSV.foreach(Rails.root.to_s+"/public/seed.csv",:headers=> :first_row) do |row|
#  participant=Participant.create(:pid => row[0],:team_id => row[1],:college =>row[2],:fname=>row[3],:lname=>row[4],:email => row[5],:phone =>row[6],:gender=>row[7],:bcity => row[8],:teligible => row[9])
#  puts participant.inspect
#end
#
#CSV.foreach(Rails.root.to_s+"/public/team_seed.csv",:headers=> :first_row) do |row|
#  team=Team.create(:team_id => row[0],:name =>row[2],:college=>row[1])
#  puts team.inspect
#end

#CSV.foreach(Rails.root.to_s+"/public/trip_seed.csv",:headers=> :first_row) do |row|
#  trip=Trip.create(:pid => row[0],:f_remb_eligible => row[1],:f_reason =>row[2],:f_max_remb=>row[3],:r_remb_eligible=>row[4],:r_reason => row[5],:r_max_remb =>row[6],:attending_status=>row[7],:f_ticket => row[8],:r_ticket => row[9],:hotel => row[10])
#  puts trip.inspect
#end
#CSV.foreach(Rails.root.to_s+"/public/iwta_seed.csv",:headers=> :first_row) do |row|
#  participant=Participant.create(:pid => row[0],:college =>row[1],:fname=>row[2],:email => row[3],:phone =>row[4])
#  puts participant.inspect
#end
CSV.foreach(Rails.root.to_s+"/public/ca_seed.csv",:headers=> :first_row) do |row|
  participant=Participant.create(:pid => row[0],:college =>row[1],:fname=>row[2],:email => row[3],:phone =>row[4],:bcity => row[5])
  puts participant.inspect
end