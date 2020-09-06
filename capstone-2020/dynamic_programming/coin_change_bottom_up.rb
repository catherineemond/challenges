def coin_change(coins, amount)
  memo = [0] # let's start here: an amount of zero requires 0 coin
  
  (1..amount).each do |current_amount|
    coins.each do |coin|
      next if coin > current_amount
      
      remainder = current_amount - coin
      
      if memo[remainder] # if we have a saved value here, we can add a coin
        coins_needed = memo[remainder] + 1
        cached_result = memo[current_amount]
        memo[current_amount] = coins_needed if !cached_result || coins_needed < cached_result
      end
    end
  end
  
  memo[amount] || -1
end