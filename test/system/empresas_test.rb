require "application_system_test_case"

class EmpresasTest < ApplicationSystemTestCase
  setup do
    @empresa = empresas(:one)
  end

  test "visiting the index" do
    visit empresas_url
    assert_selector "h1", text: "Empresas"
  end

  test "creating a Empresa" do
    visit empresas_url
    click_on "New Empresa"

    fill_in "Direccion comercial", with: @empresa.direccion_comercial
    check "Eliminado" if @empresa.eliminado
    fill_in "Email", with: @empresa.email
    check "Estado" if @empresa.estado
    fill_in "Llave api", with: @empresa.llave_api
    fill_in "Nit", with: @empresa.nit
    fill_in "Nombre comercial", with: @empresa.nombre_comercial
    fill_in "Razon social", with: @empresa.razon_social
    fill_in "Telefono", with: @empresa.telefono
    fill_in "Usuario", with: @empresa.usuario
    fill_in "Usuario api", with: @empresa.usuario_api
    click_on "Create Empresa"

    assert_text "Empresa was successfully created"
    click_on "Back"
  end

  test "updating a Empresa" do
    visit empresas_url
    click_on "Edit", match: :first

    fill_in "Direccion comercial", with: @empresa.direccion_comercial
    check "Eliminado" if @empresa.eliminado
    fill_in "Email", with: @empresa.email
    check "Estado" if @empresa.estado
    fill_in "Llave api", with: @empresa.llave_api
    fill_in "Nit", with: @empresa.nit
    fill_in "Nombre comercial", with: @empresa.nombre_comercial
    fill_in "Razon social", with: @empresa.razon_social
    fill_in "Telefono", with: @empresa.telefono
    fill_in "Usuario", with: @empresa.usuario
    fill_in "Usuario api", with: @empresa.usuario_api
    click_on "Update Empresa"

    assert_text "Empresa was successfully updated"
    click_on "Back"
  end

  test "destroying a Empresa" do
    visit empresas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Empresa was successfully destroyed"
  end
end
