class BoardCase
  attr_accessor :inner_content


  def initialize
    @inner_content = "_"
  end

  def edit_board_case(player_symbol)
    @inner_content = player_symbol
  end

end
