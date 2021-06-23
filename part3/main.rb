require 'json'

def main
  response = `./fetchtweets.sh`
  tweets_text = extract_tweets_text_from_response(response)

  puts tweets_text
end

def extract_tweets_text_from_response(response)
  tweets_json = JSON.parse(response)
  entries = tweets_json['data']['user']['result']['timeline']['timeline']['instructions'][0]['entries']

  entries.map do |entry|
    if entry['entryId'].start_with?('tweet')
      entry['content']['itemContent']['tweet_results']['result']['legacy']['full_text']
    end
  end
end

main if __FILE__ == $PROGRAM_NAME
