json.extract! usuario, :id, :email, :name, :empresa_id, :created_at, :updated_at
json.url usuario_url(usuario, format: :json)
