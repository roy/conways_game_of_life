# encoding: utf-8

require 'spec_helper'
require "fixtures/board_steps"

describe Board do
  context "setup game" do
    it 'prints a board with dead cells' do
      board = Board.new(10, 10)
      output = capture_stdout { board.draw }
      
      output.should == BoardSteps.first
    end

    it 'prints a board with a plus sign' do
      board = Board.new(10,10)
      board.init_plus_pattern 5, 5
      output = capture_stdout { board.draw }

      output.should == BoardSteps.second
    end

    it 'prints next step' do
      board = Board.new(10,10)
      board.init_plus_pattern 5,5
      board.evolve!

      output = capture_stdout { board.draw }

      output.should == BoardSteps.third
    end
  end
end
