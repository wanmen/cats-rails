json.array!(@articles) do |article|
  json.extract! article, :title, :summary, :content, :url, :author
  json.url article_url(article, format: :json)
end
