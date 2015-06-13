# create Player class
class Player
    attr_reader :name, :mark
    def initialize(board_grid, mark=nil)
        @@board_grid = board_grid
        @name = name
        @mark = mark
        new_player # initialize the new_player method to ask for the name everytime a new player is created
    end
    
    def new_player
        print "please enter your name: " # ask players for a name
        @name = gets.chomp
    end
    
    def won? # checks if the player won(fixed)
        # horizontal wins
        if @@board_grid["1"] == self.mark && @@board_grid["2"] == self.mark && @@board_grid["3"] == self.mark # first row
            return true
        elsif @@board_grid["4"] == self.mark && @@board_grid["5"] == self.mark && @@board_grid["6"] == self.mark # second row
            return true
        elsif @@board_grid["7"] == self.mark && @@board_grid["8"] == self.mark && @@board_grid["9"] == self.mark # third row
            return true
        # Vertical wins
        elsif @@board_grid["1"] == self.mark && @@board_grid["4"] == self.mark && @@board_grid["7"] == self.mark # first column
            return true
        elsif @@board_grid["2"] == self.mark && @@board_grid["5"] == self.mark && @@board_grid["8"] == self.mark # second column
            return true
        elsif @@board_grid["3"] == self.mark && @@board_grid["6"] == self.mark && @@board_grid["9"] == self.mark # third column
            return true
        # Diagonal wins
        elsif @@board_grid["1"] == self.mark && @@board_grid["5"] == self.mark && @@board_grid["9"] == self.mark # diagonal 1
            return true
        elsif @@board_grid["3"] == self.mark && @@board_grid["5"] == self.mark && @@board_grid["7"] == self.mark # diagonal 2
            return true
        else
            return false
        end
    end
    
end

class Game
    attr_reader :board_grid
    
    def initialize
        @board_grid = {"1" => " ", # hash with the position on the board as key and a blank space as value
                 "2" => " ",
                 "3" => " ",
                 "4" => " ",
                 "5" => " ",
                 "6" => " ",
                 "7" => " ",
                 "8" => " ",
                 "9" => " "
        }
        print "Player 1, "
        @player_one = Player.new(board_grid, "X") # creates player 1 assigning the mark X
        print "Player 2, "
        @player_two = Player.new(board_grid, "O") # creates player 2 assigning the mark O
    end
    
    def tie? # checks if its a tie
        !(@player_one.won? || @player_two.won?)
    end
    
    def game_board
        puts "#{@player_one.name} is X." # gets the name of the player from new_player method
        puts "#{@player_two.name} is O."
        puts "Instructions: Enter the position(number) where you want to place the mark. See the example below."
        board(true) # display to the user the positions where they can put their marks
        
        turn = 1
        # this loop will run while theres an empty space on the grid or if a player wins(fixed)
        while @board_grid.has_value?(" ")
            if turn % 2 == 0 # player_one will always have an odd number as a turn. If its an even number then its player_two turn.
                current_user = @player_two
            else
                current_user = @player_one
            end
            # ask the player where he/she wants to place the mark and assigns the user input to the variable move
            print "#{current_user.name}, Where do you want to place your mark? "
            move = gets.chomp

            
            # the case statement replace the key value(blank space) with the player mark
            case move
            when "1"
                @board_grid["1"] = current_user.mark if @board_grid["1"] == " "
            when "2"
                @board_grid["2"] = current_user.mark if @board_grid["2"] == " "
            when "3"
                @board_grid["3"] = current_user.mark if @board_grid["3"] == " "
            when "4"
                @board_grid["4"] = current_user.mark if @board_grid["4"] == " "
            when "5"
                @board_grid["5"] = current_user.mark if @board_grid["5"] == " "
            when "6"
                @board_grid["6"] = current_user.mark if @board_grid["6"] == " "
            when "7"
                @board_grid["7"] = current_user.mark if @board_grid["7"] == " "
            when "8"
                @board_grid["8"] = current_user.mark if @board_grid["8"] == " "
            when "9"
                @board_grid["9"] = current_user.mark if @board_grid["9"] == " "
            else
                puts "ERROR! Invalid input!"
            end
            board #display the updated board
            
            turn += 1 # increments turn
            
            if current_user.won? # if a player won display the name of the player.
                puts "#{current_user.name} WON!"
                break
            end
        end
        puts "TIE!" if tie? # if its a tie inform the user its a tie
    end
    
    # draw the board
    def board(instruction=false)
        # if instruction is true, display the board with numbers instead of user entered marks
        puts instruction ? " 1 | 2 | 3" : " #{@board_grid["1"]} | #{@board_grid["2"]} | #{@board_grid["3"]}"
        puts "---|---|---"
        puts instruction ? " 4 | 5 | 6" : " #{@board_grid["4"]} | #{@board_grid["5"]} | #{@board_grid["6"]}"
        puts "---|---|---"
        puts instruction ? " 7 | 8 | 9" : " #{@board_grid["7"]} | #{@board_grid["8"]} | #{@board_grid["9"]}"
    end
end

new_game = Game.new # create a new game
new_game.game_board # start the game board
