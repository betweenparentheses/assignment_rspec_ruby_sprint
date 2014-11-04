require 'calculator'

describe Calculator do
  let(:c) { Calculator.new }
  
  #The add class properly adds numbers, whether positive or negative, integer or float.
  describe '#add' do
    it 'returns the sum of its arguments' do
      expect(c.add(1, 2)).to eq(3)
    end

    it 'properly adds negatives' do
      expect(c.add(-2, 2)).to eq(0)
    end

    it 'adds floats properly' do
      expect(c.add(1.5, 2.5)).to eq(4.0)
    end

    it 'returns a float when adding a float to an integer' do
      expect(c.add(1, 0.3)).to eq(1.3)
    end

  end

  # The subtract method properly subtracts numbers, whether positive, negative, integer or float.
  describe '#subtract' do

    it 'returns the difference of its arguments' do
      expect(c.subtract(4, 2)).to eq(2)
    end

    it 'correctly cancels negatives' do
      expect(c.subtract(4, -2)).to eq(6)
    end

    it 'subtracts two floats' do
      expect(c.subtract(2.5, 0.3)).to eq(2.2)
    end

    it 'returns a float when subtracting a float from an integer' do
      expect(c.subtract(5, 2.5)).to eq(2.5)
    end

  end

  describe '#multiply' do

    it 'returns the product of its arguments' do
      expect(c.multiply(6, 8)).to eq(48)
    end

    it 'returns a negative number when multiplying a positive times a negative' do
      expect(c.multiply(6, -8)).to eq(-48)
    end

    it 'multiplies with floats' do
      expect(c.multiply(2.0, 3.3)).to eq(6.6)
    end

  end

  # The divide method properly divides numbers, raises an ArgumentError
  # if the second argument is negative, returns an integer if there is
  # no remainder and a float if there is.
  describe '#divide' do

    it 'divides the first argument by the second argument' do
      expect(c.divide(10, 2)).to eq(5)
    end

    it 'returns an integer if there is no remainder' do
      expect(c.divide(10, 2)).to be_kind_of(Integer)
    end

    it 'returns a float if there is a remainder' do
      expect(c.divide(10, 3)).to be_kind_of(Float)
    end

    it 'raises an ArgumentError if the second argument is negative' do
      expect{c.divide(8, -3)}.to raise_error(ArgumentError)
    end
  end

  # pow method properly raises numbers to their power, including negative and decimal powers
  describe '#pow' do

    it 'raises the first argument to the power of the second argument' do
      expect(c.pow(2,3)).to eq(8)
    end

    it 'returns 1 if the power is 0' do
      expect(c.pow(25,0)).to eq(1)
    end

    it 'handles negative exponents' do
      expect(c.pow(2, -2)).to eq(0.25)
    end

    it 'handles decimal powers' do
      expect(c.pow(9, 0.5)).to eq(3.0)
    end

  end

  #The sqrt method properly determines square roots for positive numbers,
  # raises errors for negative inputs, returns integers for round roots 
  # or 2-digit decimals for non-round roots.
  describe '#sqrt' do

    it 'determines square roots for positive numbers' do
      expect(c.sqrt(16)).to eq(4)
    end

    it 'returns integers for round roots' do
      expect(c.sqrt(9)).to be_kind_of(Integer)
    end

    it 'raises an error for negative inputs' do
      expect {c.sqrt(-1)}.to raise_error
    end

    it 'returns a decimal for non-round roots' do
      expect(c.sqrt(3)).to be_kind_of(Float)
    end

    it 'returns 2-digit decimals for non-round roots' do
      root = c.sqrt(3)
      decimal_places = root.to_s.split('.').last.size
      expect(decimal_places).to eq(2)
    end

  end

  describe '#memory' do
    it 'returns nil if memory has not been set' do
      expect(c.memory).to equal(nil)
    end

    it 'returns the last value memory has been set to' do
      c.memory = 10
      expect(c.memory).to eql(10)
    end

    it 'clears memory once it has been called' do
      c.memory = 10
      c.memory
      expect(c.memory).to equal(nil)
    end

  end

  describe '#memory=' do

    it 'stores an object in memory' do
      c.memory = 12
      expect(c.memory).to eq(12)
    end

    it 'overwrites any previous object in memory' do
      c.memory = 1
      c.memory = 99
      expect(c.memory).to eql(99)
    end

  end



  context 'with stringify input set as true' do
    let(:c_stringified) { Calculator.new(true) }

    describe '#add' do
      it 'should return a string' do
        expect(c_stringified.add(1,3)).to be_kind_of(String)
      end
    end

    describe '#add' do
      it 'should return a string' do
        expect(c_stringified.subtract(1,3)).to be_kind_of(String)
      end
    end

    describe '#add' do
      it 'should return a string' do
        expect(c_stringified.multiply(1,3)).to be_kind_of(String)
      end
    end

    describe '#add' do
      it 'should return a string' do
        expect(c_stringified.divide(1,3)).to be_kind_of(String)
      end
    end

    describe '#add' do
      it 'should return a string' do
        expect(c_stringified.pow(1,3)).to be_kind_of(String)
      end
    end

    describe '#add' do
      it 'should return a string' do
        expect(c_stringified.sqrt(3)).to be_kind_of(String)
      end
    end

  end

end
