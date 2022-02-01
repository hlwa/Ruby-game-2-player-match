class Player
  attr_accessor :name, :answer, :life
  def initialize(name,life=3)
    @name = name
    @life = life
  end
end

class Game
  attr_accessor :player1, :player2, :turn, :start_life
  def initialize(p1,p2)
    @player1 = p1
    @player2 = p2
    @start_life = p1.life
    @turn = 0
  end

  def get_num
    rand(1..20)
  end

  def get_score
    puts "p1: #{player1.life} / #{self.start_life}  vs  p2: #{player2.life} / #{self.start_life}"
  end

  def game_start
    #if both palyer1 & player2 survive-----------------------------------------------------------------
    while @player1.life >0 && @player2.life >0 do
      # ------------player1's turn
      if @turn != 0
        puts "----NEW TURN----"
      end
      num1 = self.get_num
      num2 = self.get_num
      right_answer = num1 + num2

      puts "#{player1.name}, what does #{num1} plus #{num2} equal?"
      answer = $stdin.gets.chomp
      
      #if right answer
      if answer.to_i == right_answer.to_i
        puts "#{player1.name}: Yes! You are correct!"
        self.get_score
      else      #if wrong answer
        player1.life -= 1
        puts "#{player1.name}: Seriously? Wrong!"
        self.get_score
      end
      # ------------player2's turn
      if @turn != 0
        puts "----NEW TURN----"
      end
      num1 = self.get_num
      num2 = self.get_num
      right_answer = num1 + num2
      puts "#{player2.name}, what does #{num1} plus #{num2} equal?"
      answer = $stdin.gets.chomp
      #if right answer
      if answer.to_i == right_answer.to_i
        puts "#{player2.name}: Yes! You are correct!"
        self.get_score
      #if wrong answer
      else
        player2.life -= 1
        if player2.life == 0
          puts "----GAME OVER----"
          puts "Good bye!"
          exit
        end
        puts "#{player2.name}: Seriously? Wrong!"
        self.get_score
      end
      @turn += 1
       # ------------one whole turn
    end

    #if only palyer1 survive-----------------------------------------------------------------
    while @player1.life >0 && @player2.life == 0
     # ------------player1's turn
      if @turn != 0
        puts "----NEW TURN----"
      end
      num1 = self.get_num
      num2 = self.get_num
      right_answer = num1 + num2
      puts "#{player1.name}, what does #{num1} plus #{num2} equal?"
      answer = $stdin.gets.chomp
      #if right answer
      if answer.to_i == right_answer.to_i
        puts "#{player1.name}: Yes! You are correct!"
        self.get_score
      #if wrong answer
      else
        player1.life -= 1
        if player1.life == 0
          puts "----GAME OVER----"
          puts "Good bye!"
          exit
        end
        puts "#{player1.name}: Seriously? Wrong!"
        self.get_score
      end
    end

    #if only palyer2 survive-----------------------------------------------------------------
    while @player2.life >0 && @player1.life == 0 do
      # ------------player1's turn
       if @turn != 0
         puts "----NEW TURN----"
       end
       num1 = self.get_num
       num2 = self.get_num
       right_answer = num1 + num2
       puts "#{player2.name}, what does #{num1} plus #{num2} equal?"
       answer = $stdin.gets.chomp
       #if right answer
       if answer == right_answer
         puts "#{player2.name}: Yes! You are correct!"
         self.get_score
       #if wrong answer
       else
         player2.life -= 1
         if player2.life == 0
          puts "----GAME OVER----"
          puts "Good bye!"
          exit
         end
         puts "#{player2.name}: Seriously? Wrong!"
         self.get_score
       end
     end
  end
end

player1 = Player.new("Player1")
player2 = Player.new("Player2")

new_game = Game.new(player1,player2)
new_game.game_start


