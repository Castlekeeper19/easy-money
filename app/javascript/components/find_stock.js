//const input = document.querySelector('#search');
// const results = document.querySelector('#results');
console.log()


const display = (data) => {
  const stockName = document.querySelector("#stock_ticker");

  const stockPrice = document.querySelector("#stock_stock_price");
  const stockType = document.querySelector("#stock_asset_type");
  stockName.value = data.symbol;
  stockPrice.value = data.regularMarketPrice.raw;
  stockType.value = data.quoteType;
}

const findStock = () => {
  const input = document.querySelector("#stockForm input");
  const stockSearch = document.querySelector("#stockForm");
  // console.log(stockName);


  if (stockSearch) {
  stockSearch.addEventListener("submit", (event) => {
    // 2.5 preventDefault()
    event.preventDefault();
    fetch(`https://apidojo-yahoo-finance-v1.p.rapidapi.com/stock/v2/get-profile?symbol=${input.value}&region=US`, {
    "method": "GET",
    "headers": {
      "x-rapidapi-key": process.env.RAPID_API_KEY,
      "x-rapidapi-host": "apidojo-yahoo-finance-v1.p.rapidapi.com"
        }
      })
      .then(response => response.json())
        .then((data) => {
        const stockData = data.price;
        display(stockData);
        })
    });
  };
}
export { findStock };




