class Game
  attr_accessor :players

  def initialize
    initialize_players
    initialize_board
    running_game
  end

  def initialize_players(nb_of_players = 2)
    @players = []
    symbols = ["x", "o"]

    nb_of_players.times do |player_nb|
      puts "Bienvenue Joueur ! Quel est ton nom ?"
      print "> "
      player_name = gets.chomp
      player = Player.new(player_name)
      player.symbol = symbols[player_nb % symbols.length]
      @players << player
    end

    return @players
  end

  def initialize_board
    @datas_board = Board.new(3)
    @visual_board = BoardView.new(@datas_board)
  end

  def translate_player_decision(chosen_case)
    input_player = chosen_case.strip.split("")

    if input_player.length == 2
      # On itère d'abord sur la lettre.
      letter = input_player[0].upcase

      # On vérifie que la lettre correspond bien à une ligne existante.
      if ("A".."C").include?(letter)
        letter = letter.ord
        chosen_case_line_nb = letter - "A".ord
      else
        puts "Cette case n'existe pas."
        return false
      end

      #On itère ensuite sur le chiffre.
      number = input_player[1].to_i

      # On vérifie que ce chiffre correspond bien à une colonne existante.
      if (1..3).include?(number)
        chosen_case_column_nb = number - 1
      else
        puts "Cette case n'existe pas."
        return false
      end
    else
      return false
    end
    return chosen_case_line_nb, chosen_case_column_nb
  end

  def running_game
    while true
      @players.each do |player|
        # On affiche la grille à jour.
        @visual_board.draw_board

        valid_input = false
        # S'il se trompe dans le choix de sa case, le joueur rejoue.
        # Conditions pour modifier la case :
        # 1. qu'il ne se soit pas trompé dans l'écriture de son choix ET # 2. qu'elle soit libre
        while valid_input == false
          chosen_case = player.chose_case_to_play
          case_line, case_column = translate_player_decision(chosen_case)
          valid_input = case_line != false && @datas_board.is_case_available?(case_line, case_column) == true
          pp valid_input
        end
        @datas_board.update_cases(case_line, case_column, player.symbol)
      end
    end
  end
end
