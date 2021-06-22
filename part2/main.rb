require 'json'
require_relative 'helpers'

def main
  response = `./fetchhints.sh`
  hints = extract_hints(response)

  response = `./fetchlinks.sh`
  links = extract_links(response)

  puts hints, JSON.pretty_generate(links)
end

main if __FILE__ == $PROGRAM_NAME
