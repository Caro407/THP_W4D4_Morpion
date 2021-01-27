class Game
  attr_accessor :players

  def initialize_players(nb_of_players = 2)
    @players = []
    symbols = ['x', 'o']

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
    datas_board = Board.new(3)
    visual_board = BoardView.new(datas_board)
    visual_board.draw_board
  end
end
