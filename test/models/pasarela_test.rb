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
require 'test_helper'

class PasarelaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
