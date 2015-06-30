json.array!(@cars) do |car|
  json.extract! car, :id, :image, :place, :rating_points, :rating_count, :integer, :user_id
  json.url car_url(car, format: :json)
end
