def coin_change(coins, amount)
  return 0 if amount == 0
  results = []

  coins.sort.each do |coin|
    (coin..amount).each do |current_amount|
      if coin == current_amount
        results[current_amount] = 1
      elsif coin < current_amount && results[current_amount - coin]
        current_result = 1 + results[current_amount - coin]
        if results[current_amount].nil? || current_result < results[current_amount]
          results[current_amount] = current_result
        end
      end
    end
  end
  results[amount] || -1
end

p coin_change([1, 2, 5], 11) == 3
p coin_change([2], 3) == -1
p coin_change([1, 5, 10, 25, 100], 25) == 1
p coin_change([1, 5, 10, 25, 100], 15) == 2
p coin_change([1, 4, 15, 20, 50], 23) == 3
p coin_change([1, 5, 10, 21, 25], 63) == 3

coins = [186, 419, 83, 408]
amount = 6249
p coin_change(coins, amount) # => 20
