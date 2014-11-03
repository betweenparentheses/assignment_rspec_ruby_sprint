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
      expect(c.multiply(2.0 * 3.3)).to eq(6.6)
    end
    
  end
  
  describe '#divide' do
    
  end
  
  describe '#pow' do
    
  end
  
  describe '#sqrt' do
    
  end
  
  describe '#memory=' do
    
  end
  
  describe '#memory' do
    
  end
  
  context 'with stringify input set as true' do
    let(:c_stringified) { Calculator.new(true) }
    
  end
  
end
