window.tipo_pasarela = (select) => {
  let pasarela = select.options[select.selectedIndex].text;
  if (pasarela == "VISANET") {
    document.querySelector("div.empresa_pasarela_merchant").style.display =
      "block";
  } else {
    document.querySelector("div.empresa_pasarela_merchant").style.display =
      "none";
  }
};
