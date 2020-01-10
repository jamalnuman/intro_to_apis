#to use a gem, you have to require the gem
require 'http' #the require argument needs to be in quotation marks 

response = HTTP.get("https://data.cityofchicago.org/resource/xzkq-xp2w.json")
employees = response.parse #parse is a method in the http gem that was downloaded

employees.each do |employee|
puts "Name: #{employee["name"]}"
puts "Job Title: #{employee['job_titles']}"
puts "Dept: #{employee['department']}"

puts 

if employee['salary_or_hourly'] == "Salary"
  puts "Annual Salary: $#{employee["annual_salary"]}"
  puts
elsif employee['salary_or_hourly'] == "Hourly"
  puts "Hourly Rate: $#{employee["hourly_rate"]}"
  puts
end


  p employee
  puts "=" * 30
end

# require 'http'

# response = HTTP.get("https://data.cityofchicago.org/resource/xzkq-xp2w.json")
# employees = response.parse

# employees.each do |employee|
#   puts "Name: #{employee["name"]}"
#   puts "Job: #{employee["job_titles"]}"
#   puts "Dept: #{employee["department"]}"

#   puts

#   if employee["salary_or_hourly"] == "Salary"
#     puts "Salary: $#{employee["annual_salary"]}"
#   else
#     puts "Typical Hours: #{employee["typical_hours"]}"
#     puts "Hourly Rate: #{employee["hourly_rate"]}"
#     rate_per_week = employee["typical_hours"].to_i * employee["hourly_rate"].to_f
#     puts "Estimated Salary: $#{ rate_per_week * 50 }"
#   end

#   puts
#   puts "=" * 30
#   puts
# end