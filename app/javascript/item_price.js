const price = () => {
  const priceInput = document.getElementById("item-price");
  if (priceInput) {
    priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;
      console.log(inputValue);
      const addTaxDom = document.getElementById("add-tax-price");
      if (addTaxDom) {
        addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
      }
    });
  }
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);