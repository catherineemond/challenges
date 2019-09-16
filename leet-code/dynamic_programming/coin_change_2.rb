# Top down approach (588ms)

def coin_change(coins, amount)
  value = count_coins(coins, amount, [])
  value == Float::INFINITY ? -1 : value
end

def count_coins(coins, amount, memo)
  return 0 if amount == 0
  return memo[amount] if memo[amount]

  min = Float::INFINITY

  coins.each do |coin|
    if coin > amount
      next
    else
      current_result = count_coins(coins, (amount - coin), memo)
      min = current_result if current_result < min
    end
  end

  min = (min == Float::INFINITY ? min : min + 1)
  memo[amount] = min
end

# Bottom up approach (652ms)

def coin_change(coins, amount)
  results = []
  results[0] = 0

  (1..amount).each do |current_amount|
    coins.each do |coin|
      if coin > current_amount
        next
      elsif coin <= current_amount && results[current_amount - coin]
        current_result = results[current_amount - coin] + 1
        if results[current_amount].nil? || current_result < results[current_amount]
          results[current_amount] = current_result
        end
      end
    end
  end

  results[amount] || -1
end

coins = [1, 2, 5]
amount = 11

p coin_change(coins, amount)
p coin_change([2], 2)
p coin_change([2], 4)
p coin_change([1, 2, 5], 21)
p coin_change([1, 5, 10, 25, 100], 15)
p coin_change([1, 4, 15, 20, 50], 23)
p coin_change([2, 5, 10, 20, 50], 21)
p coin_change([4, 5], 27)
p coin_change([5, 10], 3)
p coin_change([5, 10], 94)
p coin_change([2], 3)
