# == Schema Information
#
# Table name: roles
#
#  id            :integer          not null, primary key
#  descripcion   :string(255)
#  name          :string(255)
#  resource_type :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  resource_id   :integer
#
# Indexes
#
#  i_rol_nam_res_typ_res_id  (name,resource_type,resource_id)
#  i_rol_res_typ_res_id      (resource_type,resource_id)
#  index_roles_on_name       (name)
#
class Role < ApplicationRecord

  validates :name, presence: true, uniqueness: { case_sensitive: true }, length: {maximum: 50}
  
  has_and_belongs_to_many :users, :join_table => :users_roles
  
  belongs_to :resource,
             :polymorphic => true,
             :optional => false
  

  validates :resource_type,
            :inclusion => { :in => Rolify.resource_types },
            :allow_nil => false

  scopify
end
