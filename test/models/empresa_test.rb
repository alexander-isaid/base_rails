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
require 'test_helper'

class EmpresaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
