class CreatePasarelas < ActiveRecord::Migration[6.0]
  def change
    create_table :pasarelas do |t|
      t.string :nombre
      t.string :url_servicio
      t.boolean :estado
      t.boolean :eliminado

      t.timestamps
    end
  end
end
