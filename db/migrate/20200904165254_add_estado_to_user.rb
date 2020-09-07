class AddEstadoToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :estado, :boolean
    add_column :users, :eliminado, :boolean
  end
end
