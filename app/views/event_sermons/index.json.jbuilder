json.array!(@event_sermons) do |event_sermon|
  json.extract! event_sermon, :id, :titil, :preacher, :sermon_date, :content, :sermon_audio, :sermon_video
  json.url event_sermon_url(event_sermon, format: :json)
end
