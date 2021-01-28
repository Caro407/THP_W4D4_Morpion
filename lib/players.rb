class Player
  attr_accessor :name, :symbol

  def initialize(name, symbol = " ")
    @name = name
    @symbol = symbol
  end

  def chose_case_to_play
    puts "Quelle case souhaitez-vous choisir ?"
    print "> "
    choice = gets.chomp
  end
end
