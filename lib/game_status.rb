# Helper Method
require 'pry'
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],  # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  # First column
  [1,4,7],  # Second column
  [2,5,8],  # Third column
  [0,4,8],  # Diagonal left-right
  [2,4,6]  #Diagonal right-left
  # ETC, an array for each win combination
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
  # binding.pry
    position_1 = board[win_combination[0]] # load the value of the board at win_index_1
    position_2 = board[win_combination[1]] # load the value of the board at win_index_2
    position_3 = board[win_combination[2]] # load the value of the board at win_index_3

    if position_1 == " " || position_2 == " " || position_3 == " "
      false
    elsif position_1 == position_2 && position_2 == position_3 && position_1 != " "
     return win_combination
    end
  end
  false
end

def full?(board)
  board.all? do |position|
    position != " "
  end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  if won?(board)
    position = won?(board)
    position.each do |x|
    if board[x] == "X"
      return "X"
    else
      return "O"
    end
    end
  end
end

