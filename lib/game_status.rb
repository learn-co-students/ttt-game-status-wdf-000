# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]


def won?(board)

  WIN_COMBINATIONS.each do |arr|

    one = arr[0]
    two = arr[1]
    three = arr[2]

    if board[one] == board[two] && board[two] == board[three] && board[one] != " "
        return arr
    end
  end
  return false
end


def full?(board)

  not_full = board.any? do |space|
    space == " " || space == "  "
  end
  !not_full
end


def draw?(board)
won?(board) == false && full?(board) ? true : false
end

def over?(board)
  if won?(board) != false || draw?(board) || full?(board)
    return true
  else 
    return false
  end
end

def winner(board)
  if won?(board) != false
    arr = won?(board)
  return board[arr[0]]
end
end




