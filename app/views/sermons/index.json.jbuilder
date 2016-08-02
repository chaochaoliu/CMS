json.array!(@sermons) do |sermon|
  json.extract! sermon, :id, :title, :start_time, :preacher, :content, :category
  json.url sermon_url(sermon, format: :json)
end
