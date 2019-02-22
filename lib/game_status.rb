# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #Top row
  [3,4,5], #Middle row
  [6,7,8], #last row
  [0,3,6], #left down
  [1,4,7], #middle down
  [2,5,8], #right down
  [0,4,8], #diagonal
  [2,4,6], #diagonal
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0] #grabs 0, 3, 6 etc.
    win_index_2 = win_combination[1] #grabs 1, 4, 7 etc.
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination #returns win_comb that won
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination #returns win_comb that won
    end
  end
  false
end

board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]

def full?(board)
  board.none?{|move| move == " "}
end

# def full?(board)
#  if board.any? {|move| move == " "}
#  return false
#  else
#     return true
#   end
# end

# def full?(board)
#   board.all? do |move|
#     if move == "X" || move == "O"
#     return true
#     else
#       false
#     end
#   end
# end         #why doesn't this pass the second test to return false?

def draw?(board)
#if board not won & full = true
#if board not won & not full || board won = false
#if won?(board) is false then check:
#  full?(board)
  if won?(board) == false && full?(board) == true
    return true
  end
end
# #why don't I have to write the false premise? - rspec passes me for the false ??
  #is the else false part assumed?

def over?(board)
  #if board won, draw, or full = true
  #if board !won, !draw, or !full = false
  if won?(board) == true || draw?(board) == true || full?(board) == true
    return true
  end
end

def winner(board)
#return token (X or O) that has won the game
  #won?(board) outputs indexes - compare the indexes to the board
#  if won?(board)[0] == "O"

  # if board[won?(board)[0]] == "O"
  #   return "O"
  # end
  #
  # if board[won?(board)[0]] == "X"
  #   return "X"
  # end
  # if draw?(board) == true || over?(board) == false
  #   return nil
  # end
  if won?(board) #if this statement is true
    board[won?(board)[0]] #output this method
  else
    nil
  end
end
