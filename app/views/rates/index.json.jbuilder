json.array!(@rates) do |rate|
  json.extract! rate, :user_id, :rateable_id, :star
  json.url rate_url(rate, format: :json)
end
