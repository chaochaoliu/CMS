json.array!(@sermon_sign_ins) do |sermon_sign_in|
  json.extract! sermon_sign_in, :id
  json.url sermon_sign_in_url(sermon_sign_in, format: :json)
end
