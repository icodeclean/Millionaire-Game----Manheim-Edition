class Millionaire 

  def initialize()
    @player = ''
    @current_question = 0
    @continue = true
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

  def get_user_input(question)
    puts question
    prompt()
    return gets.chomp()
  end

  def get_player_name()
    title_screen()
    @player = get_user_input("\nWelcome to Who wants to be a Millionaire! What is your name?")
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
    title_screen
    user_choice = get_user_input("#{@player}, what would you like to do?\n 1 - Start Game \t 2 - Read Instructions")
      if (user_choice  == '1')
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
    puts "Question is presented"
    @current_question += 1
  end
  
  def game_sequence()
    while (@continue && @current_question <= 3) do
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
