#!/bin/sh

curl -s 'https://gql.twitch.tv/gql' \
  -H 'Client-Id: kimne78kx3ncx6brgo4mv6wki5h1ko' \
  -H 'X-Device-Id: PceH2jRurhRtVCXurozC3ZQ59gQwI4ta' \
  -H 'Content-Type: text/plain;charset=UTF-8' \
  --data-raw '[{"operationName":"SearchTray_SearchSuggestions","variables":{"queryFragment":"Pool","requestID":"71784f4c-99e3-427a-8571-7dc2a6724be1"},"extensions":{"persistedQuery":{"version":1,"sha256Hash":"2a747ed872b1c3f56ed500d097096f0cf8d365d2d5131cbdc170ae502f9b406a"}}}]' \
  --compressed
