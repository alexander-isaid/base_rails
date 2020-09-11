# == Schema Information
#
# Table name: empresa_pasarelas
#
#  id          :integer          not null, primary key
#  estado      :boolean
#  llave       :string(255)
#  merchant    :string(255)
#  username    :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  empresa_id  :integer          not null
#  pasarela_id :integer          not null
#  terminal_id :string(255)
#
# Indexes
#
#  i_emp_pas_pas_id                (pasarela_id)
#  i_empresa_pasarelas_empresa_id  (empresa_id)
#
# Foreign Keys
#
#  fk_rails_...  (empresa_id => empresas.id)
#  fk_rails_...  (pasarela_id => pasarelas.id)
#
require 'test_helper'

class EmpresaPasarelaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
