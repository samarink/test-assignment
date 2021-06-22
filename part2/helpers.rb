def extract_hints(response)
  response_hash = JSON.parse(response)
  nodes = response_hash[0]['data']['searchSuggestions']['edges']

  nodes.map { |node| node['node']['text'] }
end

