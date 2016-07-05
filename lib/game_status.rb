require 'pry'
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
  [2,4,6]
]

def won?(board)
  won = false
  WIN_COMBINATIONS.each do |win_combination|
    if win_combination.all? {|index| position_taken?(board, index)}
      test_row = []
      win_combination.each do |index|
        test_row << board[index]
      end
      if test_row.all?{|token| token == "X"} && !test_row.all?{|token| token == "O"}
        won = win_combination
      elsif !test_row.all?{|token| token == "X"} && test_row.all?{|token| token == "O"}
        won = win_combination
      end
    end
  end
  won
end

def full?(board)
   board.none?{|element| element !="X" && element !="O"}
end

def draw?(board)
  if full?(board) && !won?(board)
    true
  elsif full?(board) && won?(board)
    false
  elsif !full?(board)
    false
  else
    false
  end
end

def over?(board)
  full?(board) || draw?(board) || won?(board) != false
end

def winner(board)
  winning_combination = won?(board)
  if winning_combination != false
    board[winning_combination.first]
  else
    puts "No winner!"
  end
end
