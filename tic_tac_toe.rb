# #create Player class
# class Player
#     attr_reader :name, :mark, :mark
#     def initialize(mark=nil, mark=nil)
#         @name = name
#         @mark = mark
#         @mark = mark
#         new_player
#     end
    
#     def new_player
#         print "Enter your name: " # ask player for a name
#         @name = gets.chomp
#     end
# end

# #player_one = Player.new("X")
# #puts  "#{player_one.mark}"
# #puts "Player 1: #{player_one.ntame}"
# #player_two = Player.new(nil, "O")
# #puts  "#{player_two.mark}"
# #puts "Player 2: #{player_two.name}"

# class Game
#     def game_board
#         player_one = Player.new("X") # creates player 1 assigning the markbol X
#         #puts  "#{player_one.mark}"
#         puts "Player 1: #{player_one.name}" # gets the name of the player from new_player method
    
#         @grid = {"1" => " ", # hash with the position on the board as key and an empty string as value
#             "2" => " ",
#             "3" => " ",
#             "4" => " ",
#             "5" => " ",
#             "6" => " ",
#             "7" => " ",
#             "8" => " ",
#             "9" => " "
#         }
#         # draw the board
#         def board
#             #TODO make this into a loop
#             puts " #{@grid["1"]} | #{@grid["2"]} | #{@grid["3"]}"
#             puts "---|---|---"
#             puts " #{@grid["4"]} | #{@grid["5"]} | #{@grid["6"]}"
#             puts "---|---|---"
#             puts " #{@grid["7"]} | #{@grid["8"]} | #{@grid["9"]}"
#         end
        
        
        
        
#         i = 0 
#         while i < 10 do
#             # ask the player where he/she wants to play and assigns the user input to the variable move
#             print "Where do you want to place your mark? "
#             move = gets.chomp
            
#             # the case statement replace the key value(empty string) with X
#             case move
#             when "1"
#                 @grid["1"] = player_one.mark
#             when "2"
#                 @grid["2"] = player_one.mark
#             when "3"
#                 @grid["3"] = player_one.mark
#             when "4"
#                 @grid["4"] = player_one.mark
#             when "5"
#                 @grid["5"] = player_one.mark
#             when "6"
#                 @grid["6"] = player_one.mark
#             when "7"
#                 @grid["7"] = player_one.mark
#             when "8"
#                 @grid["8"] = player_one.mark
#             when "9"
#                 @grid["9"] = player_one.mark
#             end
#             board
#             i += 1
#         end
#     end
# end

# new_game = Game.new
# new_game.game_board




#create Player class
class Player
    attr_reader :name, :mark
    def initialize(grid, mark=nil)
        @@grid = grid
        @name = name
        @mark = mark
        new_player
    end
    
    def new_player
        print "Enter your name: " # ask player for a name
        @name = gets.chomp
    end
    
    def won?
        (@@grid["1"] == self.mark && @@grid["4"] == self.mark && @@grid["7"] == self.mark) || # first column
        (@@grid["2"] == self.mark && @@grid["5"] == self.mark && @@grid["8"] == self.mark) || # second column
        (@@grid["3"] == self.mark && @@grid["6"] == self.mark && @@grid["9"] == self.mark) || # third column
        
        (@@grid["1"] == self.mark && @@grid["2"] == self.mark && @@grid["3"] == self.mark) || # first row
        (@@grid["4"] == self.mark && @@grid["5"] == self.mark && @@grid["6"] == self.mark) || # second row
        (@@grid["7"] == self.mark && @@grid["8"] == self.mark && @@grid["9"] == self.mark) || # third row
        
        (@@grid["1"] == self.mark && @@grid["5"] == self.mark && @@grid["9"] == self.mark) ||# diagonal one
        (@@grid["3"] == self.mark && @@grid["5"] == self.mark && @@grid["7"] == self.mark) # diagonal two
    end
    
end

#player_one = Player.new("X")
#puts  "#{player_one.mark}"
#puts "Player 1: #{player_one.ntame}"
#player_two = Player.new(nil, "O")
#puts  "#{player_two.mark}"
#puts "Player 2: #{player_two.name}"

class Game
    attr_reader :grid
    
    def initialize
        @grid = {"1" => " ", # hash with the position on the board as key and an empty string as value
                 "2" => " ",
                 "3" => " ",
                 "4" => " ",
                 "5" => " ",
                 "6" => " ",
                 "7" => " ",
                 "8" => " ",
                 "9" => " "
        }
        @player_one = Player.new(grid, "X") # creates player 1 assigning the mark X
        @player_two = Player.new(grid, "O") # creates player 2 assigning the mark O
    end
    
    def tie?
        !self.not_full? && !(@player_one.won? || @player_one.won?)
    end
    
    def game_board
        
        #puts  "#{player_one.mark}"
        puts "Player 1: #{@player_one.name}" # gets the name of the player from new_player method
        
        puts "Player 2: #{@player_two.name}"
        self.board(true) # display to the user where they can put their mark

        while self.not_full? || (!(@player_one.won? || @player_two.won?)) || self.tie? do
            # ask the player where he/she wants to play and assigns the user input to the variable move
            print "#{@player_one.name}, Where do you want to place your mark? "
            move = gets.chomp
            
            # the case statement replace the key value(empty string) with X
            case move
            when "1"
                @grid["1"] = @player_one.mark if @grid["1"] == " "
            when "2"
                @grid["2"] = @player_one.mark if @grid["2"] == " "
            when "3"
                @grid["3"] = @player_one.mark if @grid["3"] == " "
            when "4"
                @grid["4"] = @player_one.mark if @grid["4"] == " "
            when "5"
                @grid["5"] = @player_one.mark if @grid["5"] == " "
            when "6"
                @grid["6"] = @player_one.mark if @grid["6"] == " "
            when "7"
                @grid["7"] = @player_one.mark if @grid["7"] == " "
            when "8"
                @grid["8"] = @player_one.mark if @grid["8"] == " "
            when "9"
                @grid["9"] = @player_one.mark if @grid["9"] == " "
            else
                puts "ERROR! You cannot place it there!"
            end
            board
            
            print "#{@player_two.name}, Where do you want to place your mark? "
            move = gets.chomp
            
            case move
            when "1"
                @grid["1"] = @player_two.mark if @grid["1"] == " "
            when "2"
                @grid["2"] = @player_two.mark if @grid["2"] == " "
            when "3"
                @grid["3"] = @player_two.mark if @grid["3"] == " "
            when "4"
                @grid["4"] = @player_two.mark if @grid["4"] == " "
            when "5"
                @grid["5"] = @player_two.mark if @grid["5"] == " "
            when "6"
                @grid["6"] = @player_two.mark if @grid["6"] == " "
            when "7"
                @grid["7"] = @player_two.mark if @grid["7"] == " "
            when "8"
                @grid["8"] = @player_two.mark if @grid["8"] == " "
            when "9"
                @grid["9"] = @player_two.mark if @grid["9"] == " "
            else 
                puts "ERROR! You cannot place it there!"
            end
            board
            
        end
    end
    
    def not_full?
        # Checks if the hash at that given position has a value
        not_full = @grid.any? { |key, value| value == " "}
    end
         # draw the board
    def board(tutorial=false)
        #TODO make this into a loop
        
        # if tutorial is true, display the board with numbers instead of user entered marks
        puts tutorial ? " 1 | 2 | 3" : " #{@grid["1"]} | #{@grid["2"]} | #{@grid["3"]}"
        puts "---|---|---"
        puts tutorial ? " 4 | 5 | 6" : " #{@grid["4"]} | #{@grid["5"]} | #{@grid["6"]}"
        puts "---|---|---"
        puts tutorial ? " 7 | 8 | 9" : " #{@grid["7"]} | #{@grid["8"]} | #{@grid["9"]}"
    end
end

new_game = Game.new
new_game.game_board

#puts "true " if true
#puts "false " if false