json.array!(@videos) do |video|
  json.extract! video, :title, :cover, :summary, :url, :lecturer
  json.url video_url(video, format: :json)
end
