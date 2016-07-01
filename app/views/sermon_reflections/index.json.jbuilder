json.array!(@sermon_reflections) do |sermon_reflection|
  json.extract! sermon_reflection, :id, :content
  json.url sermon_reflection_url(sermon_reflection, format: :json)
end
