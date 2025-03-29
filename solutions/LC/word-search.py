
def exist(board: List[List[str]], word: str) -> bool:
    rows = len(board)
    cols = len(board[0])
    path = set()

    directions = {(1,0), (-1,0), (0,1), (0,-1)}    

    def dfs(row, col, wordIndex):
        if wordIndex == len(word):
            return True
        
        if not isValid(row, col) or word[wordIndex] != board[row][col] or (row, col) in path:
            return False
        
        path.add((row, col))

        for rowOffset, colOffset in directions:
            if dfs(row + rowOffset, col + colOffset, wordIndex + 1):
                return True
        
        path.remove((row, col))
        return False

    def isValid(row, col) -> bool:
        return row >= 0 and row < rows and col >= 0 and col < cols
    
    for r in range(rows):
        for c in range(cols):
            if word[0] != board[r][c]:
                continue
            if dfs(r, c, 0):
                return True
    return False
        