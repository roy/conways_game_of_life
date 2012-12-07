require 'spec_helper'

describe CellCollection do
  context "finds cell" do
    it 'retreives cell' do
      collection = CellCollection.new
      cell = Cell.new(:alive)

      collection.add_cell_at cell, 5,5

      collection.cell_at(5,5).should == cell
    end
  end
end
