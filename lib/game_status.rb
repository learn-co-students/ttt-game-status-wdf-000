# Helper Method
require 'pry'

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
  result = false
  if !board.all? { |space| space == " "  }
    WIN_COMBINATIONS.each do |i|
      if board[i[0]] == board[i[1]] && board[i[1]] == board[i[2]] && board[i[0]] != " "
        result = i
      end
    end
  end
  result
end

def full?(board)
  !board.include?(" ")
end

def draw?(board)
  full?(board) && won?(board)==false ? true : false
end

def over?(board)
  draw?(board) || full?(board) && draw?(board) == false ? true : false
end

def winner(board)
  (winner= won?(board)) != false ? board[winner[0]] : nil
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
