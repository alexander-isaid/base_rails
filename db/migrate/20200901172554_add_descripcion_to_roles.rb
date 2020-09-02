class AddDescripcionToRoles < ActiveRecord::Migration[6.0]
  def change
    add_column :roles, :descripcion, :string
  end
end
