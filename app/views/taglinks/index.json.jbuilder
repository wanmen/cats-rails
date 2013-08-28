json.array!(@taglinks) do |taglink|
  json.extract! taglink, :tag_id, :tagable
  json.url taglink_url(taglink, format: :json)
end
