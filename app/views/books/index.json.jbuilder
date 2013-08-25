json.array!(@books) do |book|
  json.extract! book, :title, :dbid, :cover, :summary, :isbn, :author, :publisher, :url
  json.url book_url(book, format: :json)
end
