require 'spec_helper'

describe Cell do
  context "Rules" do
    before :each do 
      @board = Board.new(10,10)
    end

    it "#1: Any live cell with fewer than two live neighbours dies, as if caused by under-population." do
      cell = Cell.new(@board, :alive)

      cell.neighbours = []
      cell.neighbours.length.should == 0
      cell.calculate_next_step
      cell.evolve!
      cell.should be_dead
    end

    it "#2: Any live cell with two or three live neighbours lives on to the next generation." do
      cell = Cell.new(@board, :alive)
      neighbours = [Cell.new(@board, :alive), Cell.new(@board, :alive), Cell.new(@board, :dead), Cell.new(@board, :dead)]

      cell.neighbours = neighbours

      cell.alive_neighbours.should == 2
      cell.calculate_next_step
      cell.evolve!
      cell.should be_alive
    end

    it "#3: Any live cell with more than three live neighbours dies, as if by overcrowding." do
      cell = Cell.new(@board, :alive)
      neighbours = [Cell.new(@board, :alive), Cell.new(@board, :alive), Cell.new(@board, :alive), Cell.new(@board, :alive), Cell.new(@board, :dead)]

      cell.neighbours = neighbours

      cell.alive_neighbours.should == 4
      cell.calculate_next_step
      cell.evolve!
      cell.should be_dead
    end

    it "#4: Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction." do
      cell = Cell.new(@board, :dead)
      neighbours = [Cell.new(@board, :alive), Cell.new(@board, :alive), Cell.new(@board, :alive), Cell.new(@board, :dead), Cell.new(@board, :dead)]

      cell.neighbours = neighbours

      cell.alive_neighbours.should == 3
      cell.calculate_next_step
      cell.evolve!
      cell.should be_alive
    end
  end

end
