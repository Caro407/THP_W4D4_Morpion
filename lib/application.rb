class Application

    def initialize
        loop_games
    end

    def restart?
        puts "Voulez-vous rejouer ?"
        puts "O - OUI"
        puts "N - NON"
        players_choice = gets.chomp
        if players_choice == "O"
            puts "C'est parti !"
            return true
        else
            puts "A la prochaine !"
            return false
        end
    end

    def loop_games
        players_wanna_play = true
        while players_wanna_play == true
            game = Game.new
            players_wanna_play = restart?
        end
    end
end