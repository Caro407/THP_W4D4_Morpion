class Game
    attr_accessor :players

def initialize_players
    @players = []
    puts "Bienvenue Joueur 1 ! Quel est ton nom ?"
    print '> '
    player1_name = gets.chomp
    player1 = Player.new(player1_name)
    @players << player1

    puts "Au tour de Joueur 2 maintenant ! Comment tu t'appelles ?"
    print '> '
    player2_name = gets.chomp
    player2 = Player.new(player2_name)
    @players << player1
end

end