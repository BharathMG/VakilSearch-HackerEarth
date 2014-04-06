json.array!(@lawyer_services) do |lawyer_service|
  json.extract! lawyer_service, :id, :code, :service_code, :service_name, :charges
  json.url lawyer_service_url(lawyer_service, format: :json)
end
