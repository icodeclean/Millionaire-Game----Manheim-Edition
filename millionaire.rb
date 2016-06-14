class Millionaire 

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

  def menu()
    title_screen
    user_choice = get_user_input("#{@player}, what would you like to do?:\n 1 - Start Game \t 2 - Read Instructions")
      if (user_choice  == '1')
        puts " Play Game"
      elsif (user_choice  == '2')
        puts "Instructions"
      else
        title_screen
        puts "\nInvalid input, Please answer 1 to Start Game or 2 to Read Instructions"
        menu()
      end
  end

  def play()
    get_player_name()
    menu() 
  end

end

game = Millionaire.new()
game.play()
