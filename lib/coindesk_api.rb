class CoindeskApi
    require 'net/http'
    require 'json' 

    def initialize(type, margin, exchange_rate)
        @type = type.downcase
        @margin = margin
        @exchange_rate = exchange_rate
      end

    def self.btc_price
      @url = "https://api.coindesk.com/v1/bpi/currentprice.json"
      @uri = URI(@url)
      @response = Net::HTTP.get(@uri)
      result = JSON.parse(@response)
      @btc_current_price = result["bpi"]["USD"]
      return @btc_current_price["rate_float"]
    end

    def calculate()
        usd_rate = self.class.btc_price
        result =  @margin / 100
        margin = usd_rate * result
        if @type === "sell"
          rate_in_usd = usd_rate - margin
        elsif @type === "buy"
          rate_in_usd = usd_rate + margin
        end
        price = rate_in_usd * @exchange_rate
        {
            errors: false,
            price: {
                price: price
            }
        }
      end    

end