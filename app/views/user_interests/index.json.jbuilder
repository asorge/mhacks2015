json.array!(@user_interests) do |user_interest|
  json.extract! user_interest, :id, :company_id, :user_id, :rating
  json.url user_interest_url(user_interest, format: :json)
end
