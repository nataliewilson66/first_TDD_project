require 'rspec'
require 'problems'

describe "#my_uniq" do
  it "takes in an Array" do
    expect { my_uniq([1,2,3]) }.not_to raise_error
  end

  it "returns an Array" do
    expect(my_uniq([1,2,3])).to be_an_instance_of(Array)
  end

  it "returns array with duplicate elements removed" do
    expect(my_uniq([1, 2, 1, 3, 3])).to eq([1, 2, 3])
  end

  it "returns array with elements in the order in which they first appeared" do
    expect(my_uniq([1, 2, 1, 3, 3])).to eq([1, 2, 3])
  end

end

describe Array do

  describe "#two_sum" do
    it "returns an Array" do
      expect([].two_sum).to be_an_instance_of(Array)
    end

    it "finds elements which sum to zero" do
      expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    end

    it "returns each pair sorted smaller index first" do
      expect([-1, 1].two_sum).to eq([[0, 1]])
    end

    it "returns array of pairs which is sorted dictionary-wise" do
      expect([-1, 1, 1, 2, -2].two_sum).to eq([[0, 1], [0, 2], [3, 4]])
    end
  end

end

describe "#my_transpose" do 
  subject(:array) { [[0, 1, 2], [3, 4, 5], [6, 7, 8]] }
  it "accepts a square 2D Array as arg" do
    expect { my_transpose([[1, 2], [3, 4]]) }.not_to raise_error
  end

  it "returns an Array" do
    expect(my_transpose([])).to be_an_instance_of(Array)
  end

  it "converts from row-oriented to col-oriented (and vice versa)" do
    expect(my_transpose(array)).to eq( [[0, 3, 6], [1, 4, 7], [2, 5, 8]] )
  end

end

describe "#stock_picker" do
  subject(:stock_prices)  { [12, 30, 2, 45, 43, 17] }
  it "accepts an Array as arg" do
    expect { stock_picker([]) }.not_to raise_error
  end

  it "returns an Array" do
    expect(stock_picker([])).to be_an_instance_of(Array)
  end

  it "returns a pair of days which are the most profitable" do
    expect(stock_picker(stock_prices)).to eq([2, 3])
  end
end

describe TowerOfHanoi do

  describe "#initialize" do
    subject(:new_tower) { TowerOfHanoi.new(3, 4) }

    it "accepts two Integers as args" do
      expect { new_tower }.not_to raise_error
    end

    it "creates a 2D array of length x with y number of discs" do
      expect(new_tower.towers).to eq([[4, 3, 2, 1], [], []])
    end
  end

  describe "#move" do
    subject(:tower) { TowerOfHanoi.new(3, 4) }
    before(:each) do
      tower.move(0, 1)
      tower.move(0, 2)
    end

    it "accepts two tower indexes as args" do
      expect { tower.move(1, 2) }.not_to raise_error
    end

    it "returns the tower array" do
      expect(tower.move(1, 2)).to be_an_instance_of(Array)
    end

    it "raises error if move is invalid" do
      expect { tower.move(0, 2) }.to raise_error("invalid move")
    end

    it "pops element from tower x and pushes that element to tower y" do
      expect(tower.move(1, 2)).to eq([[4, 3], [], [2, 1]])
    end
  end

  describe "#won?" do
    subject(:tower) { TowerOfHanoi.new(3, 3) }

    it "returns false when game is not solved" do
      expect(tower.won?).to be false
    end

    context "when player won" do 
      before(:each) do
        tower.move(0, 2)
        tower.move(0, 1)
        tower.move(2, 1)
        tower.move(0, 2)
        tower.move(1, 0)
        tower.move(1, 2)
        tower.move(0, 2)
      end

      it "returns true when player wins game" do
        expect(tower.won?).to be true
      end
    end
    
  end

end