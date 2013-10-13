json.array!(@xevents) do |xevent|
  json.extract! xevent, :title, :content, :summary, :location, :time
  json.url xevent_url(xevent, format: :json)
end
