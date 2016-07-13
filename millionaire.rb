class Millionaire 
  
  attr_reader :current_question, :current_prize, :continue, :buddy_lifeline, :chance_lifeline, :audience_lifeline, :utilize_lifeline, :current_correct_answer
  attr_writer :current_question, :current_prize, :continue, :buddy_lifeline, :chance_lifeline, :audience_lifeline, :utilize_lifeline, :current_correct_answer

  def initialize()
    @player = ''  # Player name
    @current_question = 0 # Current question array position in @selected_questions. Also serves as counter for the actual current question
    @continue = true
    @prize_for_questions = [100, 200, 300, 500, 1000, 2000, 4000, 8000, 16000, 32000, 64000, 125000, 250000, 500000, 1000000]
    @current_prize = 0
    @buddy_lifeline = 1   # Tracks if player still has lifeline
    @chance_lifeline = 1  
    @audience_lifeline = 1
    @utilize_lifeline = {buddy_lifeline: false, chance_lifeline: false, audience_lifeline: false }  # Sets if lifeline will be utilized for current question
    @current_correct_answer = ''
    
    # Question Databank with choices and correct answer
    @data_bank = [
    ['In what city is Manheim\'s Headquarters Located?', 'A: New York', 'B: Detroit', 'C: Atlanta', 'D: Miami', 'C'],
    ['Manheim is a subsidiary of what company?', 'A: Coke', 'B: Cox Enterprises', 'C: Daimler-Benz', 'D: Pirelli', 'B'],
    ['What kind of company is Manheim?', 'A: Auto maker', 'B: ', 'C: Mars', 'D: Venus', 'D'],
    ['Name a major service that Manheim provides?', 'A: Auto conditioning', 'B: Auto upgrades', 'C: Auto marketing', 'D: Auto remarketing', 'D'],
    ['What is Manheim\'s stance on the environment?', 'A: Don\'t care', 'B: Dedicated to protect the environment', 'C: Uncommitted', 'D: Unknown', 'B'],
    ['In 1965, Manheim purchased which Virginia Auto Auction company?', 'A. National Auto Dealers Exchange', 'B. Fredercicksburg Auto Auction', 'C. Alexandria Classic Car Auctions', 'D. Fairfax Auto House', 'B'],
    ['The Manhiem Market Report provides pricing calculations based on sales transactions for the previous?', 'A: 6 months', 'B: 9 months', 'C: 13 months', 'D: 12 months', 'C'],
    ['According to Manheim’s Sale Light system, what would a red/yellow color indicates:', 'A: Vehicle sold without title present', 'B: Vehicle sold under announced conditions', 'C: Vehicle sold as-is, no arbitration', 'D: Vehicle sold as-is', 'C'],
    ['What year did the first Manheim auto auction take place?', 'A: 1946', 'B: 1947', 'C: 1950', 'D: 1945', 'D'],
    ['According to the website, Manheim registers nearly _____ used vehicles annually?', 'A: 10 million', 'B: 6 million', 'C: 12 million', 'D: 7 million', 'D'],
    ['Manheim’s Supplier Diversity program requires businesses to be at least _____ owned and operated by one or more minority groups.', 'A: 25%', 'B: 50%', 'C: 51%', 'D: 45%', 'C'],
    ['In how many countries does Manheim currently operate?', 'A: 13', 'B: 11', 'C: 15', 'D: 8', 'B'],
    ['In what year did Manheim become the world’s largest auto auction?', 'A: 1964', 'B: 1956', 'C: 1959', 'D: 1965', 'C'],
    ['How many locations does Manheim operate worldwide?', 'A: 141', 'B: 122', 'C: 112', 'D: 98', 'B'],
    ['What are Manheim Customer Care operating hours on Saturdays?', 'A: 7am-12m', 'B: 9am-11pm', 'C: 8am-11pm', 'D: 8am-12pm', 'D'],
    ['What year did Manheim launch it’s first ever operations in Turkey?', 'A: 2008', 'B: 2010', 'C: 2006', 'D: 2011', 'A'],
    ['What are the four categories covered under Manheim’s Specialty Auctions?', 'A: Powersports, Boats, Recreational, Trucks and Equipment', 'B: Exotic Highline, Boats, Powersports, Recreational', 'C: Trucks, Exotic Highline, Boats, Recreational', 'D: Boats, Classics, Recreational, Trucks', 'A'],
    ['Which state has the most Manheim auction locations?', 'A: Florida', 'B: Georgia', 'C: Californa', 'D: Detriot', 'A'],
    ['Total Resource Auctions is a vehicle remarketing company specializing in:', 'A: Antique Luxury Vehicles', 'B: Damaged and Recovered-Theft Inventory & Parts Cars', 'C: Antique Salvage Vehicles', 'D: Damaged and Recovered Inventory', 'B'],
    ['In what state did Manheim start it’s auction company?', 'A: Virginia', 'B: Pennsylvania', 'C: New Jersey', 'D: Georgia', 'B'],
    ['In what year did Manheim have it’s first ever live satellite auction?', 'A: 1998', 'B: 1986', 'C: 1994', 'D: 2000', 'C'],
    ['What service does NextGear Capital provide for Manheim customers?', 'A: Warranty Services', 'B: Lending Services', 'C: Repair Services', 'D: Vehicle Acquisitions', 'B'],
    ['How many days of coverage does the DealSheid guarantee offer?', 'A: 30', 'B: 45', 'C: 21', 'D: 15', 'C'],
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
    puts "\nWHO WANTS TO BE A MILLIONAIRE -- MANHEIM EDITION"
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
    puts "\nThank You #{@player}!"
    sleep(1)
  end

  def instructions()
    title_screen()
    puts <<-INSTRUCTIONS
      Instructions:

      Try to win $1 million by answering all 15 questions
      correctly. You have three lifelines to help you
      along the way, and they are:

      1 - Call a Buddy: Ask your friend the question and he 
          or she will give you the answer and the percentage of 
          how sure they are.

      2 - 50% Chance: this lifeline removes two of the wrong
          answers.

      3 - Audience Assistance: Summon the help of the audience.

    INSTRUCTIONS
    back_to_menu = get_user_input("\nPress enter when you are done reading...")
      menu() if defined?(back_to_menu) 
  end  

  def menu()
    title_screen()
    user_choice = get_user_input("\n#{@player}, what would you like to do?\n 1 - Start Game \t 2 - Read Instructions")
      if (user_choice  == '1')
        game_sequence()
      elsif (user_choice  == '2')
        instructions()
      else
        title_screen
        puts "\n\nInvalid Response!, Please answer 1 to Start Game or 2 to Read Instructions"
        sleep(1.5)
        menu()
      end
  end
  
  def present_question()
    show_question_with_options()
    show_available_lifelines()
    show_lifeline_clues()
    check_answer()
    continue()
  end

  def show_question_with_options()
    space = '   '
    current_question_set = @selected_questions[@current_question]
    @current_correct_answer =  current_question_set[5]
    puts "\n"
    puts "Q#{@current_question + 1}. " + current_question_set[0] + "\t  For: $#{@prize_for_questions[@current_question]}" 
      if @utilize_lifeline[:chance_lifeline] == false
        puts space + current_question_set[1] + "\n" + space + current_question_set[2] + "\n" + space +  current_question_set[3]  +  "\n" + space + current_question_set[4]
      else 
        if (['A','B']).include?(@current_correct_answer)
          puts space + current_question_set[1] + "\n" + space + current_question_set[2]
        else
          puts space +  current_question_set[3]  +  "\n" + space + current_question_set[4]
        end
        @utilize_lifeline[:chance_lifeline] = false
      end
  end

  def show_available_lifelines()
    lifelines =''
    puts "\n"
    lifelines << "1: Call-A-Buddy      " unless @buddy_lifeline == 0
    lifelines << "2: 50% Chance      " unless @chance_lifeline == 0
    lifelines << "3: Audience Assistance" unless @audience_lifeline == 0
    puts lifelines
  end

  def chance_lifeline()
    @chance_lifeline = 0
    @utilize_lifeline[:chance_lifeline] = true
    game_sequence()
  end

  def buddy_lifeline()
    @buddy_lifeline = 0
    @utilize_lifeline[:buddy_lifeline] = true
    game_sequence()
  end

    def audience_lifeline()
    @audience_lifeline = 0
    @utilize_lifeline[:audience_lifeline] = true
    game_sequence()
  end

  def show_lifeline_clues()
    if @utilize_lifeline[:buddy_lifeline] == true
      puts "\n\n"
      puts "Your awesome buddy is 70% sure you should pick '#{buddy_guess()}'"
      @utilize_lifeline[:buddy_lifeline] = false
    elsif @utilize_lifeline[:audience_lifeline] == true
      puts "\n\n"
      puts "50% of the audience votes for '#{audience_guess()}'"
      @utilize_lifeline[:audience_lifeline] = false
    else
      # No lifeline called
    end
  end

  def buddy_guess()
    wrong_choices = ['A', 'B', 'C', 'D'] #Due to nature of delete(), Have to assign choices to a variable before calling it
    wrong_choices.delete(@current_correct_answer)
    case rand(100) + 1
      when  1..70   then @current_correct_answer
      when 71..100  then wrong_choices.sample()
    end
  end

    def audience_guess()
    wrong_choices = ['A', 'B', 'C', 'D'] #Due to nature of delete(), Have to assign choices to a variable before calling it
    wrong_choices.delete(@current_correct_answer)
    random_wrong_choice = wrong_choices.sample()
    [random_wrong_choice, @current_correct_answer].sample()
  end
  
  def continue()
    title_screen()
    decision = get_user_input("\nWould you like to:\n1 - Continue     2 - Leave with $#{@current_prize}?")
      if (decision == '1')
        @continue = true
        game_sequence()
      elsif (decision == '2')
        leave()
      else
        title_screen
        puts "\n***   Invalid Input! Please select '1' to Continue   or   '2' to leave with your current prize  ***"
        sleep(1.5)
        continue()
      end  
  end

  def check_answer()
    player_response = get_user_input('').upcase 

      if player_response == @current_correct_answer
        award_prize()
      elsif (['1','2','3']).include?(player_response)
        use_lifeline(player_response)
      elsif (['A','B','C','D']).include?(player_response) && !(player_response == @current_correct_answer)
        missed()
      else
        puts "***   Invalid Input! Please select A, B, C, D or Available Lifelines: 1, 2, 3   ***" 
        sleep(1.5)
        game_sequence()
      end  
  end

  def use_lifeline(lifeline)
    if lifeline == '1' && @buddy_lifeline == 1
      buddy_lifeline()
    elsif lifeline == '2' && @chance_lifeline == 1
      chance_lifeline()
    elsif lifeline == '3' && @audience_lifeline == 1
      audience_lifeline()
    else
      title_screen()
      puts "\n\n***   #{@player}, You have already used that lifeline. Please select something else   ***"
      sleep(1.5)
      game_sequence()
    end
  end

  def missed()
    title_screen()
      if @current_question >= 9 
        puts "\nAwwww, You missed it #{@player}! But WOW, you have won an amazing $#{@prize_for_questions[9]}!" 
        puts "Well Done and Good luck to you! \n\n\n"
      elsif @current_question >= 4 
        puts "\nAwwww, You missed it #{@player}!, At least you go home with $#{@prize_for_questions[4]}" 
        puts "Well Done and Good luck to you! \n\n\n"  
      else
        puts "\nAwwww, Wrong answer! You lost it all! Better luck next time!"
        puts "Gambling ain't easy, stick with your tech job!\n\n\n"
      end
    exit
  end    

  def award_prize()
    @current_prize = @prize_for_questions[@current_question]
    grand_prize() if  @current_prize == 1000000
    title_screen()
    puts "\n Well done #{@player}, You have Won $#{@current_prize}!"
    @current_question += 1
    sleep(1.5)
  end 

  def leave()
    title_screen()
    puts "\n\nYou have Chosen to leave with $#{@current_prize}"
    puts "Well done #{@player}, Good luck to you! \n\n\n"
    @continue = false
  end
  
  def game_sequence()
    title_screen()
    while (@continue == true && @current_question <= 14) do
      present_question()
    end      
  end

  def play()
    get_player_name()
    menu()
  end

  def grand_prize()
    clear()
    puts "\n\n  OMG! OMG! #{@player.upcase}! YOU JUST BECAME A MILLIONAIRE!!!"
    puts "  I CAN'T BELIEVE IT! LAWDAMERCY!!!  CONGRATULATIONS!!!!!\n\n"
      
puts ' /$$      /$$                     /$$                 /$$              '
puts '| $$$    /$$$                    | $$                |__/              '
puts '| $$$$  /$$$$  /$$$$$$  /$$$$$$$ | $$$$$$$   /$$$$$$  /$$ /$$$$$$/$$$$ '
puts '| $$ $$/$$ $$ |____  $$| $$__  $$| $$__  $$ /$$__  $$| $$| $$_  $$_  $$'
puts '| $$  $$$| $$  /$$$$$$$| $$  \ $$| $$  \ $$| $$$$$$$$| $$| $$ \ $$ \ $$'
puts '| $$\  $ | $$ /$$__  $$| $$  | $$| $$  | $$| $$_____/| $$| $$ | $$ | $$'
puts '| $$ \/  | $$|  $$$$$$$| $$  | $$| $$  | $$|  $$$$$$$| $$| $$ | $$ | $$'
puts '|__/     |__/ \_______/|__/  |__/|__/  |__/ \_______/|__/|__/ |__/ |__/' + "\n\n"
                                                                       
puts ' /$$      /$$ /$$ /$$ /$$ /$$                               /$$                    '
puts '| $$$    /$$$|__/| $$| $$|__/                              |__/                    '
puts '| $$$$  /$$$$ /$$| $$| $$ /$$  /$$$$$$  /$$$$$$$   /$$$$$$  /$$  /$$$$$$   /$$$$$$ '
puts '| $$ $$/$$ $$| $$| $$| $$| $$ /$$__  $$| $$__  $$ |____  $$| $$ /$$__  $$ /$$__  $$'
puts '| $$  $$$| $$| $$| $$| $$| $$| $$  \ $$| $$  \ $$  /$$$$$$$| $$| $$  \__/| $$$$$$$$'
puts '| $$\  $ | $$| $$| $$| $$| $$| $$  | $$| $$  | $$ /$$__  $$| $$| $$      | $$_____/'
puts '| $$ \/  | $$| $$| $$| $$| $$|  $$$$$$/| $$  | $$|  $$$$$$$| $$| $$      |  $$$$$$$'
puts '|__/     |__/|__/|__/|__/|__/ \______/ |__/  |__/ \_______/|__/|__/       \_______/' + "\n\n\n"

    exit
  end 

end

game = Millionaire.new()
game.play()
