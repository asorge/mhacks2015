json.array!(@job_listings) do |job_listing|
  json.extract! job_listing, :id, :company_id, :title, :description, :location, :url, :date_posted, :contact
  json.url job_listing_url(job_listing, format: :json)
end
