function count (){
  const baseNum = document.getElementById("item-price");
  baseNum.addEventListener("keyup", () => {
  const taxNum = document.getElementById("add-tax-price")
  const baseVal = baseNum.value
  const calcTax = Number(baseVal) * 0.1
  const tAx = Math.floor(calcTax)
  taxNum.innerHTML = `${tAx}`
});
  baseNum.addEventListener("keyup", () => {
    const profitNum = document.getElementById("profit")
    const baseVal = baseNum.value
    const calcProfit = Number(baseVal) * 0.9
    const proFit = Math.floor(calcProfit)
    profitNum.innerHTML = proFit
  })
};

window.addEventListener('load', count);