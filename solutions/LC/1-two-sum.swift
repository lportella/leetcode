func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var map = [Int: Int]()
    var answer = [Int]()
    
    for (index, value) in nums.enumerated() {
        let diff = target - value
        if let value = map[diff] {
            answer.append(contentsOf: [value, index])
        }
        map[value] = index
    } 

    return answer
}