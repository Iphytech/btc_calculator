module Types
  class QueryType < Types::BaseObject
    field :calculate_price, Types::PriceType, null: false do
      description "BTC Exchange calculator"
      argument :type, String, required: true
      argument :margin, Float, required: true
      argument :exchange_rate, Float, required: true
    end
    def calculate_price(type:, margin:, exchange_rate:)
      response = CoindeskApi.new(type, margin, exchange_rate).calculate
      response[:price]  
    end
  end
end

