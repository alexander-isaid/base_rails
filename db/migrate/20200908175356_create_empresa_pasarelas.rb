class CreateEmpresaPasarelas < ActiveRecord::Migration[6.0]
  def change
    create_table :empresa_pasarelas do |t|
      t.references :empresa, null: false, foreign_key: true
      t.references :pasarela, null: false, foreign_key: true
      t.boolean :estado
      t.string :username
      t.string :llave
      t.string :terminal_id
      t.string :merchant

      t.timestamps
    end
  end
end
