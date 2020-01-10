#to use a gem, you have to 
require 'http' #the require argument needs to be in quotation marks 

response = HTTP.get("https://data.cityofchicago.org/resource/xzkq-xp2w.json")
employees = response.parse #parse is a method in the http gem that was downloaded

employees.each do |employee|
puts "Name: #{employee["name"]}"
puts "Job Title: #{employee['job_titles']}"
puts "Dept: #{employee['department']}"

puts 

if employee['salary_or_hourly'] == "Salary"
  puts "Annual Salary: #{employee["annual_salary"]}"
end


  p employee
  puts "=" * 30
end