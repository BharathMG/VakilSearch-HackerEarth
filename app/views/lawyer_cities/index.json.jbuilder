json.array!(@lawyer_cities) do |lawyer_city|
  json.extract! lawyer_city, :id, :code, :name, :experience, :city, :rating
  json.url lawyer_city_url(lawyer_city, format: :json)
end
