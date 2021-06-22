require 'securerandom'

def generate_mailru_emails(quantity = 100)
  prefix_length = 10
  emails = []

  quantity.times do
    emails << SecureRandom.alphanumeric(prefix_length) + '@mail.ru'
  end

  emails
end
