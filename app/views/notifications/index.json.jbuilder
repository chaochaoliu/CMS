json.array!(@notifications) do |notification|
  json.extract! notification, :id, :title, :content, :publisher, :publish_date
  json.url notification_url(notification, format: :json)
end
