json.extract! pasarela, :id, :nombre, :url_servicio, :estado, :eliminado, :created_at, :updated_at
json.url pasarela_url(pasarela, format: :json)
