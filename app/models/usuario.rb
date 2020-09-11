# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string(255)
#  eliminado              :boolean
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  estado                 :boolean
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string(255)
#  name                   :string(255)      default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  sign_in_count          :integer          default(0), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  empresa_id             :integer
#
# Indexes
#
#  i_users_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_email          (email) UNIQUE
#  index_users_on_empresa_id     (empresa_id)
#
# Foreign Keys
#
#  fk_rails_...  (empresa_id => empresas.id)
#
class Usuario < User
  validates :name, presence: true
  scope :activos, -> { where(eliminado: false)}


  def self.search_by(search_terms)
    where("LOWER(email) LIKE :search_term OR LOWER(name) LIKE :search_term", search_term:"%#{search_terms.downcase}%")
  end

  def estado_html
    if self.estado 
      'Activo'
    else
      'Inactivo'
    end
  end


  def modificar_role(role_id)
    if role_id.present?
      role = Role.find(role_id)
      if self.has_any_role?  # Pregunta si el usuario tiene roles
        if !self.has_role? role.name # verifica si el rol que eniva no esta asignado 
          self.roles_name.map{ |rol| self.remove_role(rol) } #elimina el rol que tiene asignado
          self.add_role role.name #asigna el nuevo rol
        end
      else
        self.add_role role.name #asigna el nuevo rol si en caso el usuario no tenga nigun rol
      end
    end
  end

  def eliminar_role(role)
    self.remove_role(role)
  end

  def current_role
    if self.has_any_role?
      self.roles.first.name
    else
      ""
    end
  end


end
