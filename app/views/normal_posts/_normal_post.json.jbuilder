json.extract! normal_post, :id, :post_id, :text, :created_at, :updated_at
json.url normal_post_url(normal_post, format: :json)
