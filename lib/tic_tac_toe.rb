class TicTacToe 
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

def initialize()
  @board = Array.new(9, " ")
end

def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
        user_input = input.to_i
        user_input -= 1
    end
    
  def move(board_index, token = "X") 
        @board[board_index] = token
    end

    def position_taken?(board_index)
        @board[board_index] == "X" || @board[board_index] == "O"
    end

    def valid_move?(board_index)
        board_index.between?(0,8) && !position_taken?(board_index)
    end

    def turn_count
        @board.count{|token| token == "X" || token == "O"}
    end

    def current_player
        if turn_count % 2 == 0
        "X"
        else
        "O"
      end
    end

    def turn 
        puts "Please enter 1-9"
        input = gets.strip
        index = input_to_index(input)
        token = current_player
        if valid_move?(index)
            move(index, token)
            display_board
        else
            turn 
        end 
    end

    def won?
        WIN_COMBINATIONS.detect do |win_combo|
            if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
              return win_combo
            elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
              return win_combo
            end
              false
          end
    end

    def full?
        @board.all?{|occupied| occupied != " "}
    end

    def draw?
        !(won?) && (full?)
    end

    def over?
        won? || full? || draw?
    end

    def winner
        WIN_COMBINATIONS.detect do |win_combo|
            if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
              return "X"
            elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
              return "O"
            else
              nil
            end
          end
    end

    def play
        while over? == false
            turn
          end
          if won?
            puts "Congratulations #{winner}!"
          elsif draw?
            puts "Cat's Game!"
          end
    end
end 