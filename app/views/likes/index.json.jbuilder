json.array!(@likes) do |like|
  json.extract! like, :likeable_id, :user_id
  json.url like_url(like, format: :json)
end
