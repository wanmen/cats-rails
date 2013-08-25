json.array!(@links) do |link|
  json.extract! link, :list_id, :linkable_id
  json.url link_url(link, format: :json)
end
