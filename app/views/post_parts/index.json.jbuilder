json.array!(@post_parts) do |post_part|
  json.extract! post_part, :id, :heading, :body, :price, :neighborhood, :external_url, :timestamp
  json.url post_part_url(post_part, format: :json)
end
