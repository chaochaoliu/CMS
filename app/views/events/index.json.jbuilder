json.array!(@events) do |event|
  json.extract! event, :id, :name, :strat_time
  json.url event_url(event, format: :json)
end
