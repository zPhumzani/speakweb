json.array!(@admin_articles) do |admin_article|
  json.extract! admin_article, :id, :user_id, :category_id, :title, :body, :file, :publish, :slug
  json.url admin_article_url(admin_article, format: :json)
end
