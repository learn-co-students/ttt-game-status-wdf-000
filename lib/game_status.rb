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
  board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] &&
  position_taken?(board, combo[0])

  end
end

def full?(board)
  count = 0
  board.each do |index|
    if (index == "X" || index == "O")
      count+=1
  end
end

  if(count == 9)
    return true

  elsif (count <9)
    return false

  end

end

def draw?(board)
  if(full?(board) == true && !won?(board) == true)
     return true
   elsif (full?(board) == false && !won?(board) == false)
     return false

   end

 end

def over?(board)

if(full?(board) == true || won?(board) == true || draw?(board) == true)
  return true
else
  return false
end

end


def winner(board)
  if winning_combo = won?(board)
     return board[winning_combo.first]
  end

end




board1 = ["X", "O", "O", "X", "X", "O", "X", "O", "X"]
winner(board1)
