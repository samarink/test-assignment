require 'json'
require 'erb'

BASE_URL = 'https://twitch.tv/'

def extract_hints(response)
  response_hash = JSON.parse(response)
  nodes = response_hash[0]['data']['searchSuggestions']['edges']

  nodes.map { |node| node['node']['text'] }
end

def extract_links(response)
  response_hash = JSON.parse(response)
  data = response_hash[0]['data']['searchFor']

  channels = data['channels']
  games = data['games']
  related_live_channels = data['relatedLiveChannels']
  videos = data['videos']

  links = {
    channels: extract_channels(channels),
    games: extract_games(games),
    related_live_channels: extract_related_live_channels(related_live_channels),
    videos: extract_videos(videos)
  }
end

def extract_channels(channels)
  edges = channels['edges']

  edges.map do |edge|
    login = edge['item']['login']

    "#{BASE_URL}#{login}"
  end
end

def extract_games(games)
  edges = games['edges']

  edges.map do |edge|
    name = edge['item']['name']
    name_escaped = ERB::Util.url_encode(name)

    "#{BASE_URL}directory/game/#{name_escaped}"
  end
end

def extract_related_live_channels(channels)
  edges = channels['edges']

  edges.map do |edge|
    login = edge['item']['stream']['broadcaster']['login']

    "#{BASE_URL}#{login}"
  end
end

def extract_videos(videos)
  edges = videos['edges']

  edges.map do |edge|
    id = edge['item']['id']

    "#{BASE_URL}videos/#{id}"
  end
end
