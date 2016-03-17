json.array!(@admin_categories) do |admin_category|
  json.extract! admin_category, :id, :name, :slug
  json.url admin_category_url(admin_category, format: :json)
end
