class Application
  def initialize
    visual_intro
    loop_games
  end

  def restart?
    puts "Voulez-vous rejouer ?"
    puts "O - OUI"
    puts "N - NON"
    players_choice = gets.chomp
    if players_choice == "O"
      puts "C'est parti !"
      return true
    else
      puts "A la prochaine !"
      return false
    end
  end

  def loop_games
    players_wanna_play = true
    while players_wanna_play == true
      game = Game.new
      players_wanna_play = restart?
    end
  end

  def visual_intro
    puts(<<~TAG)
    \e[93m
    --------------------------------------------------------------------------------
    |                       BIENVENUE DANS LE JEU DU MORPION                       |
    --------------------------------------------------------------------------------
        \e[0m \e[96m
      Pour rappel, le but est de vaincre l'adversaire en alignant 3 de vos symboles,
                 que ce soit en ligne, en colonne ou en digonales !\e[0m

                                   \e[95m Have fun !\e[0m 😁
                                        \e[93m
     --------------------------------------------------------------------------------
     \e[0m
    TAG
  end
end
