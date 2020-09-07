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
     scope :activos, -> { where( eliminado: false)}

     validates :nit, presence: true, uniqueness: { case_sensitive: true }
     has_many :users
     has_many :usuarios


     def self.search_by(search_terms)
          where("nit = :search_term OR nombre_comercial = :search_term OR razon_social = :search_term", search_term: search_terms)
     end


end
