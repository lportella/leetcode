/// Input
/// Expected output = 3
var grid: [[Character]] = [
    ["1","1","0","1","0"],
    ["1","1","0","1","0"],
    ["1","1","0","0","0"],
    ["0","0","0","0","1"]
]

func numIslands(_ grid: inout [[Character]]) -> Int {
    var numberOfIslands = 0
    
    for rowIndex in grid.indices {
        for colIndex in grid[rowIndex].indices {
            if grid[rowIndex][colIndex] == "0" {
                continue
            }
            numberOfIslands += 1
            searchForNeighbourIslands(&grid, rowIndex, colIndex)
        }
    }
            
    return numberOfIslands
}

func searchForNeighbourIslands(_ grid: inout [[Character]], _ row: Int, _ col: Int) {
    guard isValidIndex(&grid, row, col) else {
        return
    }
    
    if grid[row][col] == "0" {
        return
    }
    
    grid[row][col] = "0"
    searchForNeighbourIslands(&grid, row - 1, col) /// UP
    searchForNeighbourIslands(&grid, row + 1, col) /// DOWN
    searchForNeighbourIslands(&grid, row, col - 1) /// LEFT
    searchForNeighbourIslands(&grid, row, col + 1) /// RIGHT
}

func isValidIndex(_ grid: inout [[Character]], _ row: Int, _ col: Int) -> Bool {
    row >= 0 && row < grid.count && col >= 0 && col < grid[row].count
}

print("Islands found: \(numIslands(&grid))")
