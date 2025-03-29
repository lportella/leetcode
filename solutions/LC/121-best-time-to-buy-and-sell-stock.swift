func maxProfit(_ prices: [Int]) -> Int {
    var left = 0
    var right = 1
    var maxProfit = 0

    while right < prices.count {
        if prices[left] > prices[right] {
            left = right
        } else {
            let profit = prices[right] - prices[left]
            maxProfit = max(maxProfit, profit)
        }
        right += 1
    } 

    return maxProfit
}
