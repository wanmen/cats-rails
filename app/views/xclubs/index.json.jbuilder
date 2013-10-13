json.array!(@xclubs) do |xclub|
  json.extract! xclub, :name, :started, :summary, :thumbnail
  json.url xclub_url(xclub, format: :json)
end
