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
    print "\nThank You #{@player}! "
    sleep(1)
  end

  def play()
    get_player_name()
  end

end

game = Millionaire.new()
game.play()
