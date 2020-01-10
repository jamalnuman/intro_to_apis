require "http"

system "clear" #anything passed in the system method will run in the terminal
continue = true

while continue 

  puts "Hello, which word are we defining today?"
  user_word = gets.chomp
  if user_word != "q"
  
    response = HTTP.get("https://api.wordnik.com/v4/word.json/#{user_word}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=f0c54bfe816e1c9cb917306c542021034d976d6be0d159c3c")
    
    puts

    definitions = response.parse.first(3)

    definitions.each do |word|
      puts "The definition of #{user_word} is: #{word['text']}" 
      puts "=" * 30
    end


    response = HTTP.get("https://api.wordnik.com/v4/word.json/#{user_word}/pronunciations?useCanonical=false&limit=50&api_key=f0c54bfe816e1c9cb917306c542021034d976d6be0d159c3c")

    puts
    
    pronunciations = response.parse.first(3)

    pronunciations.each do |word|
      puts "The correction pronunciations of #{user_word} is: #{word['raw']}"
      puts "=" * 30
    end 
  else
    continue = false
  end
end

