json.array!(@post_vehicles) do |post_vehicle|
  json.extract! post_vehicle, :id, :heading, :body, :price, :neighborhood, :external_url, :timestamp
  json.url post_vehicle_url(post_vehicle, format: :json)
end
