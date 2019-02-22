# Helper Method
require 'pry'
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

def won?(board)
  if WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]
      if position_1 == position_2 && position_3 == position_1 && position_1 != " "
        return win_combination
      # elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      #   return win_combination
      end
    end
  else
    return false
  end
end

def full?(board)
  if board.all? {|x| x == "X" || x == "O"}
    return true
  else
    return false
  end
end

# def full?(board)
#   if board.all? do |x|
# result =  x == "X" || x == "O"
#     return true
#   end
#   else
#     return false
# end
# end

def draw?(board)
full?(board) && !won?(board)
end

def over?(board)
  if full?(board) == true || won?(board) == true || draw?(board) == true
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board) && !draw?(board)
    result = won?(board)
    # binding.pry
    y = result[0]
    return board[y]
  else
    return nil
  end
end
