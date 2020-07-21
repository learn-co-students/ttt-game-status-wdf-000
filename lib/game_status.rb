# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    if board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && position_taken?(board, combo[0])
     return combo
    else
      false
    end
  
  end
end

def full?(board)
  board.all? { |letter| letter == 'X' || letter == 'O' }
end
      
def draw?(board)
  if won?(board)
    false
  elsif full?(board)
    true
  else
    false
  end
end

def over?(board)
  if won?(board)
    true
  elsif full?(board)
    true
  else
    false
  end
end

 def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  else
    nil
  end
end