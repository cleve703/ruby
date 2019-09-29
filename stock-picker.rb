def stock_picker(array)
    profits = []
    array.each_with_index do |price, index|
      i = array.length - 1
      while i >= index + 1
        profit = (array[i] - price)
        profits.push([profit, index, i])
        i -= 1
      end
    end
    maxProfitDays = profits.max[1,2]
    maxProfitAmount = profits.max[0]
    puts "You would earn $#{maxProfitAmount} by buying and selling on days #{maxProfitDays}"
    return maxProfitDays
  end
  
  stock_picker([2,8,9,2,3,5])