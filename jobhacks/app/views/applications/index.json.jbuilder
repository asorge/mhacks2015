json.array!(@applications) do |application|
  json.extract! application, :id, :user_id, :job_listing_id, :resume, :cover_letter, :date_submitted, :status, :contact
  json.url application_url(application, format: :json)
end
