json.array!(@companies) do |company|
  json.extract! company, :id, :name, :url, :description, :location
  json.url company_url(company, format: :json)
end
