class Board
  attr_accessor :board_cases

  def initialize(side_width)
    # On veut donc créer un nouveau Board visuellement, qui sera composé de 9 cases.
    board_tab = []
    side_width.times do |index_line|
      line_elements = []
      side_width.times do |index_column|
        line_elements << BoardCase.new
      end
      board_tab << line_elements
    end
    @board_cases = board_tab
  end

  def update_cases(modified_case_line, modified_case_column, player_symbol)
    @board_cases[modified_case_line][modified_case_column].inner_content = player_symbol
  end

  def is_case_available?(modified_case_line, modified_case_column)
    @board_cases[modified_case_line][modified_case_column].inner_content == " "
  end

  def line_victory(player)
    @board_cases.each do |line|
      nb_of_symbols_player = line.count { |cell| cell.inner_content == player.symbol }
      return true if nb_of_symbols_player == 3
    end
    return false
  end

  def column_victory(player)
    (0..2).each do |col_nb|
      nb_of_symbols_player = 0
      @board_cases.each do |line|
        if line[col_nb].inner_content == player.symbol
          nb_of_symbols_player += 1
          return true if nb_of_symbols_player == 3
        end
      end
    end
    return false
  end

  def diagonal_victory(player)
    # Diagonal 1
    nb_of_symbols_player = 0
    (0..2).each do |index|
      if @board_cases[index][index].inner_content == player.symbol
        nb_of_symbols_player += 1
        return true if nb_of_symbols_player == 3
      end
    end

    # Diagonal 2
    nb_of_symbols_player = 0
    col = 2
    (0..2).each do |index|
      if @board_cases[index][col].inner_content == player.symbol
        nb_of_symbols_player += 1
        return true if nb_of_symbols_player == 3
      end
      col -= 1
    end
    return false
  end

  def match_is_even
    @board_cases.each do |line|
      return false if line.any? { |cell| cell.inner_content == " " }
    end
    return true
  end

  def won?(player)
    if line_victory(player) == true || column_victory(player) == true || diagonal_victory(player) == true
      puts "\e[93m Bravo #{player.name} ! Tu as gagné !\e[0m"
      return true
    elsif match_is_even == true
      puts "\e[91m Match nul ! \e[0m Il n'y a plus de cases sur lesquelles jouer !"
      return true
    else
      puts "Continuons à jouer !"
      return false
    end
  end
end
