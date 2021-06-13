function count (){
  const baseNum = document.getElementById("item-price");
  baseNum.addEventListener("keyup", () => {
  const taxNum = document.getElementById("add-tax-price")
  const baseVal = baseNum.value
  const calcTax = Number(baseVal) * 0.1
  taxNum.innerHTML = `${calcTax}`
});
  baseNum.addEventListener("keyup", () => {
    const profitNum = document.getElementById("profit")
    const baseVal = baseNum.value
    const calcProfit = Number(baseVal) * 0.9
    profitNum.innerHTML = calcProfit
  })
};

window.addEventListener('load', count);