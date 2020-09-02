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
require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
