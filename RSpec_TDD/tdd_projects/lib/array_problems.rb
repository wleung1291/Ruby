
  # removes duplicates from an array. 
  # It returns the unique elements in the order in which they first appeared
  def my_uniq(arr)
    unique = []

    arr.each do |ele|
      unique << ele if !unique.include?(ele)
    end
      
    return unique
  end

  # finds all pairs of positions where the elements at those positions sum to 0
  def two_sum(arr)
    pairs = []

    arr.each_with_index do |ele, i|
      if (i + 1) != nil
        (i+1..arr.length-1).each do |j|
          pairs << [i, j] if arr[i] + arr[j] == 0
        end
      end
    end

    return pairs
  end

  # convert between the row-oriented and column-oriented representations. 
  def my_transpose(arr) 
    rows = arr.first.length
    cols = arr.length
    transpose = Array.new(rows) { Array.new(cols) }

    cols.times do |i|
      rows.times do |j|
        transpose[j][i] = arr[i][j]
      end
    end

    return transpose
  end

  # takes an array of stock prices (prices on days 0, 1, ...), and outputs the 
  # most profitable pair of days on which to first buy the stock and then sell 
  # the stock. 
  def stock_picker(stock_prices)
    best_pair = []
    best_profit = 0

    stock_prices.each_with_index do |price, buy|
      stock_prices.each_with_index do |sell|
        if sell > buy
          profit = stock_prices[sell] - stock_prices[buy]
          if profit > best_profit
            best_profit = profit
            best_pair = [buy, sell]
          end
        end
      end
    end

    return best_pair
  end