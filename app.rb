require "bundler"
Bundler.require

require "pry"

["game", "players", "board", "board_case", "application", "board_view"].each do |file|
  require_relative "lib/#{file}"
end

test = Game.new
test.initialize_board

binding.pry
