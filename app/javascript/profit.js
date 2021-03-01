function profit() {
  const priceInput = document.getElementById("item-price");
     priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;
      const addTaxDom = document.getElementById("add-tax-price");
      const taxFee = inputValue * 0.1
       addTaxDom.innerHTML = Math.floor(taxFee);
      const income = document.getElementById("profit");
      const incomeFee = inputValue - taxFee
      income.innerHTML = Math.floor(incomeFee);
   })
 }
 window.addEventListener("load", profit);