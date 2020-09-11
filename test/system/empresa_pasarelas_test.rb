require "application_system_test_case"

class EmpresaPasarelasTest < ApplicationSystemTestCase
  setup do
    @empresa_pasarela = empresa_pasarelas(:one)
  end

  test "visiting the index" do
    visit empresa_pasarelas_url
    assert_selector "h1", text: "Empresa Pasarelas"
  end

  test "creating a Empresa pasarela" do
    visit empresa_pasarelas_url
    click_on "New Empresa Pasarela"

    fill_in "Empresa", with: @empresa_pasarela.empresa_id
    check "Estado" if @empresa_pasarela.estado
    fill_in "Llave", with: @empresa_pasarela.llave
    fill_in "Merchant", with: @empresa_pasarela.merchant
    fill_in "Pasarela", with: @empresa_pasarela.pasarela_id
    fill_in "Terminal", with: @empresa_pasarela.terminal_id
    fill_in "Username", with: @empresa_pasarela.username
    click_on "Create Empresa pasarela"

    assert_text "Empresa pasarela was successfully created"
    click_on "Back"
  end

  test "updating a Empresa pasarela" do
    visit empresa_pasarelas_url
    click_on "Edit", match: :first

    fill_in "Empresa", with: @empresa_pasarela.empresa_id
    check "Estado" if @empresa_pasarela.estado
    fill_in "Llave", with: @empresa_pasarela.llave
    fill_in "Merchant", with: @empresa_pasarela.merchant
    fill_in "Pasarela", with: @empresa_pasarela.pasarela_id
    fill_in "Terminal", with: @empresa_pasarela.terminal_id
    fill_in "Username", with: @empresa_pasarela.username
    click_on "Update Empresa pasarela"

    assert_text "Empresa pasarela was successfully updated"
    click_on "Back"
  end

  test "destroying a Empresa pasarela" do
    visit empresa_pasarelas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Empresa pasarela was successfully destroyed"
  end
end
