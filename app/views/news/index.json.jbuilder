json.array!(@news) do |news|
  json.extract! news, :id, :title, :author, :date, :content, :image
  json.url news_url(news, format: :json)
end
