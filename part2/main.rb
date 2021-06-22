require 'json'
require_relative 'helpers'

def main
  response = `./fetchhints.sh`
  hints = extract_hints(response)

  puts hints
end

main if __FILE__ == $PROGRAM_NAME
