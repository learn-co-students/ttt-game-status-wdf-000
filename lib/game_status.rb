# Helper Method
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

def won?(array)
  empty = array.all? do |element|
    element == " "
  end

  if(empty == true)
    return !empty

  else
    WIN_COMBINATIONS.any? do |win_combo|
      win_index1 = win_combo[0]
      win_index2 = win_combo[1]
      win_index3 = win_combo[2]

      pos1 = array[win_index1]
      pos2 = array[win_index2]
      pos3 = array[win_index3]

      if((pos1 == "X" && pos2 == "X" && pos3 == "X") || (pos1 == "O" && pos2 == "O" && pos3 == "O"))
        return win_combo
      else
        false
      end
    end
  end
end

def full?(array)
  !(blanks = array.include?(" "))
end

def draw?(array)
  if(won?(array) == false && full?(array) == true)
    true
  elsif(won?(array) == false && full?(array) == false)
    false
  else
    false
  end
end

def over?(array)
  if(won?(array) == true || draw?(array) == true || full?(array) == true)
    true
  else
    false
  end
end

def winner(array)
  if(won?(array) == false)
    return nil
  else
    w_array = won?(array)
    pos1 = w_array[0]

    if(array[pos1] == "X")
      "X"
    else
      "O"
    end
  end
end






























