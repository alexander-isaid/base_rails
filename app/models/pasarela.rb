# == Schema Information
#
# Table name: pasarelas
#
#  id           :integer          not null, primary key
#  eliminado    :boolean
#  estado       :boolean
#  nombre       :string(255)
#  url_servicio :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Pasarela < ApplicationRecord
     ## Scope para el index controlador
     scope :activas, -> { where(eliminado: false)}
     ## Scope para validar el estado de una pasarela
     scope :activa, -> { where(eliminado: false, estado: true)}
     
     def self.search_by(search_terms)
          where("LOWER(nombre) LIKE :search_term", search_term:"%#{search_terms.downcase}%")
     end

     def name
          self.nombre
     end
end
