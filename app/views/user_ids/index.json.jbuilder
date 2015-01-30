json.array!(@user_ids) do |user_id|
  json.extract! user_id, :id, :string
  json.url user_id_url(user_id, format: :json)
end
