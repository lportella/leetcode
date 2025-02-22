func connectedCell(grid: inout [[Int]]) -> Int {
    var biggestRegion = 0
    
    for rowIndex in grid.indices {
        for colIndex in grid[rowIndex].indices {
            if grid[rowIndex][colIndex] == 0 {
                continue
            }
            let connectedCells = searchForConnectedCells(&grid, rowIndex, colIndex)
            biggestRegion = max(connectedCells, biggestRegion)
        }
    }
    
    return biggestRegion
}

func searchForConnectedCells(_ grid: inout [[Int]], _ row: Int, _ col: Int) -> Int {
    guard isValidIndex(&grid, row, col), grid[row][col] == 1 else {
        return 0
    }

    var connectedCellCount = 1
    grid[row][col] = 0
    
    /// Search in all surrounding directions
    for neighbourRow in row - 1 ... row + 1 {
        for neighbourCol in col - 1 ... col + 1 {
            connectedCellCount += searchForConnectedCells(&grid, neighbourRow, neighbourCol)
        }
    }
    
    return connectedCellCount
}

func isValidIndex(_ grid: inout [[Int]], _ row: Int, _ col: Int) -> Bool {
    row >= 0 && row < grid.count && col >= 0 && col < grid[row].count
}

var grid1: [[Int]] = [
    [1, 1, 0, 0],
    [0, 1, 1, 0],
    [0, 0, 1, 0],
    [1, 0, 0, 0]
]

var grid2: [[Int]] = [
    [0, 1, 0, 0],
    [1, 1, 1, 0],
    [0, 0, 0, 1],
    [1, 0, 1, 0]
]

var grid3: [[Int]] = [
    [0, 1, 0, 0, 1, 0],
    [1, 1, 1, 0, 1, 0],
    [0, 0, 0, 1, 0, 1],
    [1, 0, 1, 0, 0, 1],
    [0, 0, 0, 0, 0, 0]
]

let expectedOutputGrid1 = 5
let expectedOutputGrid2 = 6
let expectedOutputGrid3 = 10

let output1 = connectedCell(grid: &grid1)
let output2 = connectedCell(grid: &grid2)
let output3 = connectedCell(grid: &grid3)

print("Biggest region found: \(output1). Passed: \(output1 == expectedOutputGrid1).")
print("Biggest region found: \(output2). Passed: \(output2 == expectedOutputGrid2).")
print("Biggest region found: \(output3). Passed: \(output3 == expectedOutputGrid3).")
