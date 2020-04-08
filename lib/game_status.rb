WIN_COMBINATIONS  = [[0,1,2] ,[3,4,5] ,[6,7,8] ,[0,3,6] ,[1,4,7] ,[2,5,8] ,[0,4,8] ,[6,4,2] ]
# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
def full?(board)
	return board.all?{ |x| x== "O" || x == "X" }
end

def empty?(board)
	return board.all?{ |x| x== nil || x == " "|| x == "" }
end

def draw?(board)
	
	winning_index = [[0,1,2] ,[3,4,5] ,[6,7,8] ,[0,3,6] ,[1,4,7] ,[2,5,8] ,[0,4,8] ,[6,4,2] ]
	your_index = []
	
	#checking for Xs to win
	board.each_with_index do |item,index|
		if ( item == "X" )
			your_index << index
		end
	end
	

	winning_index.each do |x|
		if ( (x-your_index).empty? )
			return false
		end	
	end


	#checking for Os to win

	your_index = []
	board.each_with_index do |item,index|
		if ( item == "O" )
			your_index << index
		end
	end


	winning_index.each do |x|
		if ( (x-your_index).empty? )
			return false
		end	
	end
end

def won?(board)
	if (empty?(board) == true )
	    return false
	end

	
	winning_index = [[0,1,2] ,[3,4,5] ,[6,7,8] ,[0,3,6] ,[1,4,7] ,[2,5,8] ,[0,4,8] ,[6,4,2] ]
	your_index = []
	
	#checking for Xs to win
	board.each_with_index do |item,index|
		if ( item == "X" )
			your_index << index
		end
	end
	

	winning_index.each do |x|
		if ( (x-your_index).empty? )
			return x
		end	
	end


	#checking for Os to win

	your_index = []
	board.each_with_index do |item,index|
		if ( item == "O" )
			your_index << index
		end
	end


	winning_index.each do |x|
		if ( (x-your_index).empty? )
			return x
		end	
	end

	if ( draw?(board) )
		return false
	end
end

def over? (board)
	winning_index = [[0,1,2] ,[3,4,5] ,[6,7,8] ,[0,3,6] ,[1,4,7] ,[2,5,8] ,[0,4,8] ,[6,4,2] ]
	your_index = []
	
	#checking for Xs to win
	board.each_with_index do |item,index|
		if ( item == "X" )
			your_index << index
		end
	end
	

	winning_index.each do |x|
		if ( (x-your_index).empty? )
			return true
		end	
	end


	#checking for Os to win

	your_index = []
	board.each_with_index do |item,index|
		if ( item == "O" )
			your_index << index
		end
	end


	winning_index.each do |x|
		if ( (x-your_index).empty? )
			return true
		end	
	end
	
	if ( !full?(board) )
		return false
	end

	return true
end

def winner(board)

	winning_index = [[0,1,2] ,[3,4,5] ,[6,7,8] ,[0,3,6] ,[1,4,7] ,[2,5,8] ,[0,4,8] ,[6,4,2] ]
	your_index = []
	
	#checking for Xs to win
	board.each_with_index do |item,index|
		if ( item == "X" )
			your_index << index
		end
	end
	

	winning_index.each do |x|
		if ( (x-your_index).empty? )
			return "X"
		end	
	end


	#checking for Os to win

	your_index = []
	board.each_with_index do |item,index|
		if ( item == "O" )
			your_index << index
		end
	end


	winning_index.each do |x|
		if ( (x-your_index).empty? )
			return "O"
		end	
	end
	return nil
end
