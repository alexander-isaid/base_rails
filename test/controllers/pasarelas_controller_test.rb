require 'test_helper'

class PasarelasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pasarela = pasarelas(:one)
  end

  test "should get index" do
    get pasarelas_url
    assert_response :success
  end

  test "should get new" do
    get new_pasarela_url
    assert_response :success
  end

  test "should create pasarela" do
    assert_difference('Pasarela.count') do
      post pasarelas_url, params: { pasarela: { eliminado: @pasarela.eliminado, estado: @pasarela.estado, nombre: @pasarela.nombre, url_servicio: @pasarela.url_servicio } }
    end

    assert_redirected_to pasarela_url(Pasarela.last)
  end

  test "should show pasarela" do
    get pasarela_url(@pasarela)
    assert_response :success
  end

  test "should get edit" do
    get edit_pasarela_url(@pasarela)
    assert_response :success
  end

  test "should update pasarela" do
    patch pasarela_url(@pasarela), params: { pasarela: { eliminado: @pasarela.eliminado, estado: @pasarela.estado, nombre: @pasarela.nombre, url_servicio: @pasarela.url_servicio } }
    assert_redirected_to pasarela_url(@pasarela)
  end

  test "should destroy pasarela" do
    assert_difference('Pasarela.count', -1) do
      delete pasarela_url(@pasarela)
    end

    assert_redirected_to pasarelas_url
  end
end
