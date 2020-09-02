json.extract! empresa, :id, :nit, :razon_social, :nombre_comercial, :direccion_comercial, :email, :usuario, :telefono, :usuario_api, :llave_api, :estado, :eliminado, :created_at, :updated_at
json.url empresa_url(empresa, format: :json)
