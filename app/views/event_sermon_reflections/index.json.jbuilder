json.array!(@event_sermon_reflections) do |event_sermon_reflection|
  json.extract! event_sermon_reflection, :id, :name, :content, :event_sermon_id
  json.url event_sermon_reflection_url(event_sermon_reflection, format: :json)
end
