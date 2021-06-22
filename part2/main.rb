require 'json'
require_relative 'helpers'

def main
  response = `./fetchhints.sh`
  hints = extract_hints(response)

  response = `./fetchlinks.sh`
  links = extract_links(response)

  print_results hints, links
end

def print_results(hints, links)
  puts 'hints'
  puts hints
  puts
  links.each do |key, vals|
    puts key
    puts vals
    puts
  end
end

main if __FILE__ == $PROGRAM_NAME
