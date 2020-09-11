require "application_system_test_case"

class PasarelasTest < ApplicationSystemTestCase
  setup do
    @pasarela = pasarelas(:one)
  end

  test "visiting the index" do
    visit pasarelas_url
    assert_selector "h1", text: "Pasarelas"
  end

  test "creating a Pasarela" do
    visit pasarelas_url
    click_on "New Pasarela"

    check "Eliminado" if @pasarela.eliminado
    check "Estado" if @pasarela.estado
    fill_in "Nombre", with: @pasarela.nombre
    fill_in "Url servicio", with: @pasarela.url_servicio
    click_on "Create Pasarela"

    assert_text "Pasarela was successfully created"
    click_on "Back"
  end

  test "updating a Pasarela" do
    visit pasarelas_url
    click_on "Edit", match: :first

    check "Eliminado" if @pasarela.eliminado
    check "Estado" if @pasarela.estado
    fill_in "Nombre", with: @pasarela.nombre
    fill_in "Url servicio", with: @pasarela.url_servicio
    click_on "Update Pasarela"

    assert_text "Pasarela was successfully updated"
    click_on "Back"
  end

  test "destroying a Pasarela" do
    visit pasarelas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pasarela was successfully destroyed"
  end
end
