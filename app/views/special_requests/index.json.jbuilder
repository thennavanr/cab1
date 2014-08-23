json.array!(@special_requests) do |special_request|
  json.extract! special_request, :id, :request_type, :request_value
  json.url special_request_url(special_request, format: :json)
end
