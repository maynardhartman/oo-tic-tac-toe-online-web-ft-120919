require 'pry'
class TicTacToe
  attr_accessor :board
  
  def initialize
    @board = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [0,3,6],
    [1,4,7],
    [2,5,8]
    ]
    
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(char)
    return(char.to_i - 1)
  end
  
  def move(location, char)
    return(@board[location] = char)
  end
  
  def position_taken?(index)
    if (@board[index] == "X") || (@board[index] == "O") 
      return(true) 
    else
      return(false)
    end
  end
  
  def valid_move?(index)
    if index < 0 || index > 8
      return(false)
    end
    if position_taken?(index) == true
      return(false)
    else
      return(true)
    end
  end
  
  def turn_count
    positions_taken = 0
    index = 0
    9.times do 
      if @board[index] == "X" || @board[index] == "O"
        positions_taken += 1 
      end
      index += 1 
    end
    return(positions_taken)
  end 
  
  def current_player
    accum_X = 0
    accum_O = 0 
    @board.each_with_index do |char, index| 
      if char == "X" then accum_X += 1 end
      if char == "O" then accum_O += 1 end
    end
    if accum_X == accum_O then return("X") end
    if accum_X > accum_O then return("O") end
  end
  
  def turn
    puts "Enter your turn 1-9:" 
    a = gets.chomp
    b = input_to_index(a)
    if valid_move?(b) then c = current_player 
      move(b, c) 
      display_board
    else
      turn
    end
  end
 
  def won? #
    WIN_COMBINATIONS.each do |combination|                    ############################################  
        if @board[combination[0]] == @board[combination[1]] &&## Need some guidance here I could not get 
          @board[combination[1]] == @board[combination[2]] && ## this to work, not matter how hard I tried
          position_taken?(combination[0]+1)                   ## even borrowed some soulutions off of the 
          return combination.to_a                                  ## interwebs an they did not work either
        end                                                   ## giving up on this right now. 'till further
        if draw?                                              ## Notice.
          return(false)
        end
      end
    return false
  end
  
  def full?
    count = 0
    @board.each do |position| 
      if position == "X" or position == "O" and count <= 8
        count += 1
      else
        return(false)
      end
      
      if count == 8 
        return(true)
      end
    end
  end
  
  def draw?
    if full? == true 
      return(true)
    else
      return(false)
    end
  end
 
  def over?
    if won? == true or full? == true then return(true) end
  end
  
  def winner?(board)
    if won?(board)
      return board[won?(@board)[0]]
    end
  end
  
  def play()
    
  end  
end
