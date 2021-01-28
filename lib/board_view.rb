class BoardView
  attr_reader :board

  def initialize(board)
    @board = board
  end

  def draw_board
    
    print "\e[96m   1   2   3 "
    print "\e[91m"
    @board.board_cases.each_with_index do |index_line, index|
      letter = (index + 65).chr
      puts ""
      print "\e[96m#{letter} "

      index_line.each do |index_column|
        print "\e[93m " + index_column.inner_content.to_s + "\e[91m"
        print "\e[91m |" if index_column != index_line.last
      end
      puts ""
      print "  ---|---|---" if index != @board.board_cases.length - 1
    end
    print "\e[0m"
  end
end
