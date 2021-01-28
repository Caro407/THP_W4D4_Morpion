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
    @board_cases[modified_case_line][modified_case_column].inner_content == "_"
  end
end
