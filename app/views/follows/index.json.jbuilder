json.array!(@follows) do |follow|
  json.extract! follow, :user_id, :followable_id
  json.url follow_url(follow, format: :json)
end
