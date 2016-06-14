class Millionaire 
  
  attr_reader :current_question, :current_prize, :continue 
  attr_writer :current_question, :current_prize, :continue 

  def initialize()
    @player = ''
    @current_question = 0
    @continue = true
    @prize_for_questions = [100, 200, 300, 500, 1000, 2000, 4000, 8000, 16000, 32000, 64000, 125000, 250000, 500000, 1000000]
    @current_prize = 0
    
    @data_bank = [
    ['What kind of flytrap is named for a carnivorous animal?', 'A: Jupiter', 'B: Pluto', 'C: Mars', 'D: Venus', 'D'],
    ['What kind of flytrap is named for a carnivorous animal?', 'A: Jupiter', 'B: Pluto', 'C: Mars', 'D: Venus', 'D'],
    ['What kind of flytrap is named for a carnivorous animal?', 'A: Jupiter', 'B: Pluto', 'C: Mars', 'D: Venus', 'D'],
    ['What kind of flytrap is named for a carnivorous animal?', 'A: Jupiter', 'B: Pluto', 'C: Mars', 'D: Venus', 'D'],
    ['What kind of flytrap is named for a carnivorous animal?', 'A: Jupiter', 'B: Pluto', 'C: Mars', 'D: Venus', 'D'],
    ['What kind of flytrap is named for a carnivorous animal?', 'A: Jupiter', 'B: Pluto', 'C: Mars', 'D: Venus', 'D'],
    ['What kind of flytrap is named for a carnivorous animal?', 'A: Jupiter', 'B: Pluto', 'C: Mars', 'D: Venus', 'D'],
    ['What kind of flytrap is named for a carnivorous animal?', 'A: Jupiter', 'B: Pluto', 'C: Mars', 'D: Venus', 'D'],
    ['What kind of flytrap is named for a carnivorous animal?', 'A: Jupiter', 'B: Pluto', 'C: Mars', 'D: Venus', 'D'],
    ['What kind of flytrap is named for a carnivorous animal?', 'A: Jupiter', 'B: Pluto', 'C: Mars', 'D: Venus', 'D'],
    ['What kind of flytrap is named for a carnivorous animal?', 'A: Jupiter', 'B: Pluto', 'C: Mars', 'D: Venus', 'D'],
    ['What kind of flytrap is named for a carnivorous animal?', 'A: Jupiter', 'B: Pluto', 'C: Mars', 'D: Venus', 'D'],
    ['What kind of flytrap is named for a carnivorous animal?', 'A: Jupiter', 'B: Pluto', 'C: Mars', 'D: Venus', 'D'],
    ['What kind of flytrap is named for a carnivorous animal?', 'A: Jupiter', 'B: Pluto', 'C: Mars', 'D: Venus', 'D'],
    ['What kind of flytrap is named for a carnivorous animal?', 'A: Jupiter', 'B: Pluto', 'C: Mars', 'D: Venus', 'D'],
    ['What kind of flytrap is named for a carnivorous animal?', 'A: Jupiter', 'B: Pluto', 'C: Mars', 'D: Venus', 'D'],
    ['What kind of flytrap is named for a carnivorous animal?', 'A: Jupiter', 'B: Pluto', 'C: Mars', 'D: Venus', 'D'],
    ['What kind of flytrap is named for a carnivorous animal?', 'A: Jupiter', 'B: Pluto', 'C: Mars', 'D: Venus', 'D'],
    ['What kind of flytrap is named for a carnivorous animal?', 'A: Jupiter', 'B: Pluto', 'C: Mars', 'D: Venus', 'D'],
    ['What kind of flytrap is named for a carnivorous animal?', 'A: Jupiter', 'B: Pluto', 'C: Mars', 'D: Venus', 'D'],
    ['What kind of flytrap is named for a carnivorous animal?', 'A: Jupiter', 'B: Pluto', 'C: Mars', 'D: Venus', 'D'],
    ['What kind of flytrap is named for a carnivorous animal?', 'A: Jupiter', 'B: Pluto', 'C: Mars', 'D: Venus', 'D'],
    ['What kind of flytrap is named for a carnivorous animal?', 'A: Jupiter', 'B: Pluto', 'C: Mars', 'D: Venus', 'D'],
                   ]

    @selected_questions = randomize(@data_bank)               
  end  


  def title_screen()
    clear()
    puts "*" * 50
    puts '    /$$       /$$       /$$       /$$   '
    puts '  /$$$$$$   /$$$$$$   /$$$$$$   /$$$$$$ '
    puts ' /$$__  $$ /$$__  $$ /$$__  $$ /$$__  $$'
    puts '| $$  \__/| $$  \__/| $$  \__/| $$  \__/'
    puts '|  $$$$$$ |  $$$$$$ |  $$$$$$ |  $$$$$$ '
    puts ' \____  $$ \____  $$ \____  $$ \____  $$'
    puts ' /$$  \ $$ /$$  \ $$ /$$  \ $$ /$$  \ $$'
    puts '|  $$$$$$/|  $$$$$$/|  $$$$$$/|  $$$$$$/'
    puts ' \_  $$_/  \_  $$_/  \_  $$_/  \_  $$_/ '
    puts '   \__/      \__/      \__/      \__/   '
    puts "WHO WANTS TO BE A MILLIONAIRE -- MANHEIM EDITION"
    puts "*" * 50
  end

  def prompt()
    print '> '
  end

  def clear()
    system "clear" or system "cls"
  end

  def randomize(data_bank)
    return data_bank.shuffle.take(15)
  end

  def get_user_input(question)
    puts question
    prompt()
    return gets.chomp()
  end

  def get_player_name()
    title_screen()
    @player = get_user_input("\nWelcome to Who wants to be a Millionaire! What is your name?").capitalize
    title_screen()
    puts "Thank You #{@player}!"
    sleep(1)
  end

  def instructions()
    title_screen()
    puts "These are the instructions"
    back_to_menu = get_user_input("\nPress enter when you are done reading...")
      menu() if defined?(back_to_menu) 
  end  

  def menu()
    title_screen()
    user_choice = get_user_input("#{@player}, what would you like to do?\n 1 - Start Game \t 2 - Read Instructions")
      if (user_choice  == '1')
        title_screen()
        start_game()
      elsif (user_choice  == '2')
        instructions()
      else
        title_screen
        puts "\nInvalid Response!, Please answer 1 to Start Game or 2 to Read Instructions"
        sleep(1)
        menu()
      end
  end
  
  def present_question()
    current_question_set = @selected_questions[@current_question]
    correct_answer =  current_question_set[5]
    puts "\n\n"
    puts current_question_set[0] + "\n" + current_question_set[1] + "\t" + current_question_set[2] + "\n" + current_question_set[3] + "\t \t" + current_question_set[4]
    check_answer(correct_answer)
    continue()  
  end

  def continue()
    decision = get_user_input("\n\n#{@player}, would you like to:\n1 - Continue  2 - Leave with $#{@current_prize}?")
      if (decision == '1')
        @continue = true
        game_sequence()
      elsif (decision == '2')
        leave()
      else
        puts "\n***   Please select 1 or 2   ***"
        continue()
      end  
  end

  def check_answer(correct_answer)
    player_response = get_user_input('').upcase 
      if player_response == correct_answer
        award_prize()
      else
        
      end
  end

  def award_prize()
    @current_prize = @prize_for_questions[@current_question]
    grand_prize() if @current_prize == 1000000
    puts "\n Well done #{@player}, You have Won $#{@current_prize}"
    @current_question += 1
  end

  def grand_prize()
    title_screen
    puts "You just won a Million Smackarooos\n\n\n!!!"
    exit
  end  

  def leave()
    title_screen()
    puts "\n\nYou have Chosen to leave with $#{@current_prize}"
    puts "Well done #{@player}, Good luck to you! \n\n\n"
    @continue = false
  end
  
  def game_sequence()
    while (@continue == true && @current_question <= 3) do
      present_question()
    end      
  end
  
  def start_game()
    game_sequence()    
  end

  def play()
    get_player_name()
    menu()
  end

end

game = Millionaire.new()
game.play()
