# Helper Methods
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

def won?(board)
  if board.all? { |position| position == " " }
    false
  else
    # returns the winning array with all X's
    # also returns nil if not all X's
    a =  WIN_COMBINATIONS.detect do |combination|
      combination.all? {|index| board[index] == "X"}
    end

    if (a == nil)
      return WIN_COMBINATIONS.detect do |combination|
        combination.all? {|index| board[index] == "O"}
      end
    else
      return a
    end
  end
    # using .select returns an array that needs to be flattened
    # using .detect or .find returns the first value for which the condition
    # returns true.
    # THIS FAILS FOR DRAW
    # WIN_COMBINATIONS.detect do |combination|
    #     combination.all? do|index|
    #       if board[index] == "X"
    #         true
    #       elsif board[index] == "O"
    #         true
    #       else
    #         false
    #       end
    #     end
    #   end
    # end
end

def full?(board)
  board.all? { |e| e == "X" || e == "O" }
end

def draw?(board)
  # if full?(board) && !won?(board)
  #   true
  # else
  #   false
  # end

  full?(board) && !won?(board)
end

def over?(board)
  # won?(board) || draw?(board) ? true : false

  # ternary operator isn't needed
  won?(board) || draw?(board)
end

def winner(board)
  if won?(board)
    win = won?(board)
    board[win[0]]
  end
end
