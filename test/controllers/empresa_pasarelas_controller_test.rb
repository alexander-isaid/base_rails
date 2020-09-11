require 'test_helper'

class EmpresaPasarelasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @empresa_pasarela = empresa_pasarelas(:one)
  end

  test "should get index" do
    get empresa_pasarelas_url
    assert_response :success
  end

  test "should get new" do
    get new_empresa_pasarela_url
    assert_response :success
  end

  test "should create empresa_pasarela" do
    assert_difference('EmpresaPasarela.count') do
      post empresa_pasarelas_url, params: { empresa_pasarela: { empresa_id: @empresa_pasarela.empresa_id, estado: @empresa_pasarela.estado, llave: @empresa_pasarela.llave, merchant: @empresa_pasarela.merchant, pasarela_id: @empresa_pasarela.pasarela_id, terminal_id: @empresa_pasarela.terminal_id, username: @empresa_pasarela.username } }
    end

    assert_redirected_to empresa_pasarela_url(EmpresaPasarela.last)
  end

  test "should show empresa_pasarela" do
    get empresa_pasarela_url(@empresa_pasarela)
    assert_response :success
  end

  test "should get edit" do
    get edit_empresa_pasarela_url(@empresa_pasarela)
    assert_response :success
  end

  test "should update empresa_pasarela" do
    patch empresa_pasarela_url(@empresa_pasarela), params: { empresa_pasarela: { empresa_id: @empresa_pasarela.empresa_id, estado: @empresa_pasarela.estado, llave: @empresa_pasarela.llave, merchant: @empresa_pasarela.merchant, pasarela_id: @empresa_pasarela.pasarela_id, terminal_id: @empresa_pasarela.terminal_id, username: @empresa_pasarela.username } }
    assert_redirected_to empresa_pasarela_url(@empresa_pasarela)
  end

  test "should destroy empresa_pasarela" do
    assert_difference('EmpresaPasarela.count', -1) do
      delete empresa_pasarela_url(@empresa_pasarela)
    end

    assert_redirected_to empresa_pasarelas_url
  end
end
