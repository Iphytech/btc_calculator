# How to use

Clone the repo `https://github.com/Iphytech/btc_calculator.git` to your computer

change to the project directory

NB: There is no database (because we ain't going to make use of it).

go to the terminal and run `bundle or bundle install`

We are making use of `Net::HTTP ` for the restful api calls - Read more about it here (https://apidock.com/ruby/Net/HTTP)

And we are consuming data from `Coindesk APi endpoint`
Start the project and test what we have built

```bash

rails s or rails server

``` 

Then open your browser and type `http://localhost:3000/graphiql` 

sample request

```bash {
  calculatePrice(
    type: "sell"
    margin: 0.1
    exchangeRate: 370.0
  ) {
    price
  }
} 

``` 

sample response 

```bash
{
  "data": {
    "calculatePrice": {
      "price": 2937074.4355499996
    }
  }
} 
```
