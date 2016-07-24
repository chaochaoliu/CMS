json.array!(@suggestions) do |suggestion|
  json.extract! suggestion, :id, :title, :content, :name
  json.url suggestion_url(suggestion, format: :json)
end
