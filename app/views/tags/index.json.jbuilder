json.array!(@tags) do |tag|
  json.extract! tag, :topic_id, :tagable
  json.url tag_url(tag, format: :json)
end
