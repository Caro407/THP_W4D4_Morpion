class BoardView
  attr_reader :board

  def initialize(board)
    @board = board
  end

  def draw_board
    print "  1 2 3 "
    @board.board_cases.each_with_index do |index_line, index|
      letter = (index + 65).chr
      puts ""
      print "#{letter}"
      print "|"

      index_line.each do |index_column|
        print index_column.inner_content.to_s + "|"
      end
    end
  end
end
