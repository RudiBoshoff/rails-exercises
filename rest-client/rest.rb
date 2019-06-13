# frozen_string_literal: true

require 'rest-client'

GOOGLE = 'https://www.google.com/search?q='
YOUTUBE = 'https://www.youtube.com/results?search_query='

def google
  puts '*******************************************************'
  puts ''
  puts '                 Google Search                 '
  puts ''
  puts '*******************************************************'

  puts 'Search for:'
end

def youtube
  puts '*******************************************************'
  puts ''
  puts '                 Youtube Search                 '
  puts ''
  puts '*******************************************************'

  puts 'Search for:'
end

def query
  gets.chomp.split(' ').join('+')
end

def output(response)
  puts ' '
  puts 'Response: code'
  puts response.code

  puts ' '
  puts 'Response: Headers'
  puts ' '
  puts response.headers

  puts ' '
  puts 'Response: Cookies'
  puts response.cookies
end

def determine_search
  puts 'Choose an option (1 or 2):'
  puts '1) Search on Google'
  puts '2) Search on Youtube'
  gets.chomp.to_i
end

def search
  if determine_search == 1
    google
    response = RestClient.get "#{GOOGLE}#{query}"
    output(response)
  else
    youtube
    response = RestClient.get "#{YOUTUBE}#{query}"
    output(response)
  end
end

search
