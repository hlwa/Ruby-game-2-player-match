class Player
  attr_accessor :name, :lives

  def initialize(name)
    @name = name
    @lives = 3
  end

  def lose_life
    @lives -= 1
  end

end


class Question

  attr_reader :correct_answer

  def initialize(question_cap)
    @first_number = rand(1..(question_cap))
    @second_number = rand(1..(question_cap))
    @correct_answer = @first_number + @second_number
  end

  def display_question
    "What's #{@first_number} + #{@second_number}?"
  end

  def correct?(guess)
    guess == @correct_answer
  end

end


class Main

  attr_reader     :which_round, :active_player
  attr_accessor   :question_cap

  def initialize
    @active_player = nil
    @players = []
    @which_round = 0
    @question_cap = 20
  end

  # starts the game and begins looping through rounds.
  def run_game

    puts "Welcome to the game!"

    print "Player 1, your name? "
    player1 = Player.new(gets.chomp)
    @players << player1

    print "... And you, Player 2? "
    player2 = Player.new(gets.chomp)
    @players << player2

    puts "Welcome, #{player1.name} and #{player2.name}!\n\n"

    @active_player = @players[rand(0..1)]
    puts "According to my coin-flip, #{@active_player.name} is going SECOND!\n\n\n"

    while (@active_player.lives > 0)
        run_round
    end

    end_game
  end

  def increment_round
    @which_round += 1
  end

  # Checks the active player against @players and mutates @active_player to the other value
  def switch_player
    if (@active_player == @players[0])
      @active_player = @players[1]
    else
      @active_player = @players[0]
    end

  end

  #concludes the game, reporting the winner
  def end_game
    puts "\n\n________ GAME OVER ________"
    puts "#{@active_player.name}, you've run out of lives.\nYou're DEAD.\n\n"
    switch_player!
    puts "#{@active_player.name}, you had #{@active_player.lives} #{(@active_player.lives) == 1 ? "life" : "lives"} remaining and survived for #{(@which_round / 2).to_i} rounds, which means YOU WIN!\n"
  end

  # Runs through a standard round for the active player
  def run_round
    increment_round
    switch_player
    question = Question.new(@question_cap)
    puts "________ Question #{@which_round} ________"
    puts "#{@active_player.name}, you have #{@active_player.lives} #{(@active_player.lives) == 1 ? "life" : "lives"} remaining.\n"
    print "#{@active_player.name}, #{question.display_question} "
    answer = gets.chomp.to_i

    if question.correct?(answer)
      puts "Well done, #{@active_player.name}!  #{answer} was the correct answer.\nLet's make the questions HARDER.\n\n"
    else
      puts "#{answer}?! Nope.  It was #{question.correct_answer}.  You DIE!  (Once.)\n\n"
      @active_player.lose_life
    end
  end
end


game = Main.new

game.run_game