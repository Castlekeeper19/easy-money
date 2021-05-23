//const input = document.querySelector('#search');
// const results = document.querySelector('#results');



const display = (data) => {
  stockName.innerHTML = data.shortName;
  stockPrice.innerHTML = data.regularMarketPrice.raw;
  stockType.innerHTML = data.quoteType;

}

const findStock = () => {
  const input = document.querySelector("#stockForm input");
  const stockSearch = document.querySelector("#stockForm");
  const stockName = document.querySelector("#stockName");
  const stockPrice = document.querySelector(".stockPrice");
  const stockType = document.querySelector("#stockType");

  if (stockSearch) {
  stockSearch.addEventListener("submit", (event) => {
    // 2.5 preventDefault()
    event.preventDefault();
    fetch(`https://apidojo-yahoo-finance-v1.p.rapidapi.com/stock/v2/get-profile?symbol=${input.value}&region=US`, {
    "method": "GET",
    "headers": {
      "x-rapidapi-key": "8e5f93ae25msh506ca700c9c8e13p19e4a9jsnc5a2c8083450",
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

//Code from Yann Livecode
// 2. Listen to submit button
// form.addEventListener("submit", (event) => {
//   // 2.5 preventDefault()
//   event.preventDefault();
//   const url = `https://person.clearbit.com/v2/combined/find?email=${input.value}`;
//   // 3. Fetch API
//   fetch(url, {
//     headers: {
//       'Authorization': authorization
//     }
//   })
//   .then(response => response.json())
//   .then((data) => {
//     // 4. Display
//     const personData = data.person;
//     console.log(personData);
//     display(personData);
//     })
// });

// end of Yann's code


//



// const drawResponseList = (data) => {
//   results.innerHTML = '';
//   data.words.forEach((word) => {
//     results.insertAdjacentHTML('beforeend', `<li>${word}</li>`);
//   });
// };

// const autocomplete = (e) => {
//   fetch(`https://wagon-dictionary.herokuapp.com/autocomplete/${e.target.value}`)
//     .then(response => response.json())
//     .then(data => drawResponseList(data));
// };





// input.addEventListener('keyup', autocomplete);
