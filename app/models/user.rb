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
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  
  rolify strict: true 
  accepts_nested_attributes_for :roles
  after_create :assign_default_role

  belongs_to :empresa

  def assign_default_role
    self.add_role "empresa"
  end

  def asignar_role(name)
    role = Role.find_by(name: name)
    self.add_role role
  end

  def rol_admin?
    has_role?(:admin)
  end

  def rol_empresa?
    has_role?(:empresa)
  end

  def rol_operador?
    has_role?(:operador)
  end

end
