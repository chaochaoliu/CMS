json.array!(@event_notices) do |event_notice|
  json.extract! event_notice, :id, :title, :content, :publisher
  json.url event_notice_url(event_notice, format: :json)
end
