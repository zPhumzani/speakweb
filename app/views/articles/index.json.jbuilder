json.array!(@articles) do |article|
  json.extract! article, :id, :user_id, :category_id, :title, :body, :filename, :content_type, :file_contents, :publish, :slug
  json.url article_url(article, format: :json)
end
