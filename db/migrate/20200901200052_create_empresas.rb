class CreateEmpresas < ActiveRecord::Migration[6.0]
  def change
    create_table :empresas do |t|
      t.string :nit
      t.string :razon_social
      t.string :nombre_comercial
      t.string :direccion_comercial
      t.string :email
      t.string :usuario
      t.string :telefono
      t.string :usuario_api
      t.string :llave_api
      t.boolean :estado
      t.boolean :eliminado

      t.timestamps
    end
  end
end
