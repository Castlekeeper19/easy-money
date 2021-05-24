//const input = document.querySelector('#search');
// const results = document.querySelector('#results');
console.log(RAPIDAPIKEY)


const display = (data) => {
  stockName.innerHTML = data.shortName;
  stockPrice.innerHTML = data.regularMarketPrice.raw;
  stockType.innerHTML = data.quoteType;

}

const findStock = () => {
  const input = document.querySelector("#stockForm input");
  const stockSearch = document.querySelector("#stockForm");
  const stockName = document.querySelector("#stockName");
  const stockPrice = document.querySelector("#stockStockPrice");
  const stockType = document.querySelector("#stock_asset_type");

  if (stockSearch) {
  stockSearch.addEventListener("submit", (event) => {
    // 2.5 preventDefault()
    event.preventDefault();
    fetch(`https://apidojo-yahoo-finance-v1.p.rapidapi.com/stock/v2/get-profile?symbol=${input.value}&region=US`, {
    "method": "GET",
    "headers": {
      "x-rapidapi-key": RAPIDAPIKEY,
      "x-rapidapi-host": "apidojo-yahoo-finance-v1.p.rapidapi.com"
        }
      })
      .then(response => response.json())
        .then((data) => {
        console.log(data);
        const stockData = data.price;
        console.log(stockData);
        console.log(display(stockData));
        })
    .catch(err => {
      console.error(err);
    });
  });
  };
}
export { findStock };




