class BoardView
  attr_reader :board

  def initialize(board)
    @board = board
  end

  def draw_board
    @board.board_cases.each do |index_line|
      puts ""
      print "|"

      index_line.each do |index_column|
        print index_column.inner_content.to_s + "|"
      end
    end
  end
end
