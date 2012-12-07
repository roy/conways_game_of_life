$:.unshift File.join(File.dirname(__FILE__), "lib")


require "cell"
require "board"
require "cell_collection"


if __FILE__ == $0
  rows, cols = `tput lines; tput cols`.scan(/\d+/).map(&:to_i)

  board = Board.new(rows, cols)

  loop do
    if board.all_dead?
      input = ARGV.first.to_i
      input = 20 if input == 0
      puts "rendering new board: #{input}"
      sleep 1
      board.random(input)
    end

    sleep 0.5
    board.tick
  end
end
