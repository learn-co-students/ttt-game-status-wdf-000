
# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
[0, 1, 2],
[3, 4, 5],
[6, 7, 8],
[0, 4, 8],
[2, 4, 6],
[0, 3, 6],
[1, 4, 7],
[2, 5, 8]
]

# Helper Methods
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end


def detect_indexes(board, letter)
board.each_index.select{|index| board[index] == letter}
end

def won?(board)
  xes = detect_indexes(board, "X")
  os = detect_indexes(board, "O")
  WIN_COMBINATIONS.detect {
  |win_combo| (win_combo - xes).empty? || (win_combo - os).empty?}
end 

def full?(board)
  empties = board.select{|position| position == " "}
  empties == []
end

def draw?(board)
  !(won?(board)) && full?(board)
end 

def over?(board)
  full?(board) || won?(board)
end

def winner(board)
  xes = detect_indexes(board, "X")
  os = detect_indexes(board, "O")
  if xes == won?(board)
    return "X"
  elsif os == won?(board)
    return "O"
  end
end
