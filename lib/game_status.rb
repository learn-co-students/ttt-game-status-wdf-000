# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6],
  [0,4,8],
  [1,4,7],
  [2,5,8],
  [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.detect { |e|
    e.all? { |i| board[i] == "X" } || e.all? { |i| board[i] == "O" }
  }
end

def full?(board)
  !board.any? { |e| e == " " }
end

def draw?(board)
  won?(board) ? false : full?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  won?(board) ? board[won?(board)[0]] : nil
end
