require 'json'
require 'httparty'
require_relative 'generate_emails'

def main
  random_emails = generate_mailru_emails
  result = get_result_for_emails(random_emails, log: true)
  write_result_to_a_file(result, '../result.json')
end

def get_result_for_emails(emails, log: false)
  base_url = 'https://auth.mail.ru/api/v1/pushauth/info?login='
  result = {}

  emails.each_with_index do |email, index|
    full_url = "#{base_url}#{email}"
    response = HTTParty.get(full_url)
    data = JSON.parse(response.body)
    body = data['body']

    # a workaround for being locked by an API for making too many
    # concurrent requests, although a really slow one
    # consider finding a better approach
    if (body == 'ratelimit') || (response.code == 403)
      sleep 15
      redo
    end

    result[email] = body

    next unless log

    puts "iteration #{index + 1}"
    puts "status: #{response.code}"
    puts body
  end

  result
end

def write_result_to_a_file(result, filename)
  File.open(filename, 'w') do |f|
    f.write(JSON.pretty_generate(result))
  end
end

main if __FILE__ == $PROGRAM_NAME
