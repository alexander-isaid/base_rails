# == Schema Information
#
# Table name: empresas
#
#  id                  :integer          not null, primary key
#  direccion_comercial :string(255)
#  eliminado           :boolean
#  email               :string(255)
#  estado              :boolean
#  llave_api           :string(255)
#  nit                 :string(255)
#  nombre_comercial    :string(255)
#  razon_social        :string(255)
#  telefono            :string(255)
#  usuario             :string(255)
#  usuario_api         :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
class Empresa < ApplicationRecord
     resourcify
     scope :activas, -> { where( eliminado: false)}

     validates :nit, presence: true, uniqueness: { case_sensitive: true }
     has_many :users
     has_many :usuarios
     has_many :empresa_pasarelas

     def self.search_by(search_terms)
          where("LOWER(nit) LIKE :search_term OR LOWER(nombre_comercial) LIKE :search_term OR LOWER(razon_social) LIKE :search_term", search_term:"%#{search_terms.downcase}%")
     end

     def name
          self.nombre_comercial
     end 

end
