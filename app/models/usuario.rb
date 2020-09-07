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
    where("(email = :search_term) OR (name = :search_term)", search_term: search_terms)
  end

  def estado_html
    if self.estado 
      'Activo'
    else
      'Inactivo'
    end
  end


  def modificar_role(role_id)
    tiene_rol =self.has_any_role?
    role = Role.find(role_id)
    if tiene_rol 
      if self.has_role? role.name

      else
        self.roles_name.map{ |rol| self.remove_role(rol) }
        self.add_role role.name
      end
    else
      self.add_role role.name
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
