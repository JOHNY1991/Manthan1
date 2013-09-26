# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

CSV.foreach(Rails.root.to_s+"/public/seed.csv",:headers=> :first_row) do |row|
  participant=Participant.create(:pid => row[0],:college =>row[1],:fname=>row[2],:lname=>row[3],:email => row[4],:phone =>row[5],:age=>row[6],:gender=>row[7],:bcity => row[8],:teligible =>row[9])
  puts participant.inspect
end