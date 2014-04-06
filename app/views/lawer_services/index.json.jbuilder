json.array!(@lawer_services) do |lawer_service|
  json.extract! lawer_service, :id, :code, :service_code, :service_name, :charges
  json.url lawer_service_url(lawer_service, format: :json)
end
