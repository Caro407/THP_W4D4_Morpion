class BoardView
  attr_reader :board

  def initialize(board)
    @board = board
  end

  def draw_board
    @board.board_cases.each do |index_line|
      index_line.each do |index_column|
        pp index_column.inner_content
      end
    end
  end
end
