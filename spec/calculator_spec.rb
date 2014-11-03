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
    
    it 'can add a float to an integer' do
      expect(c.add(1, 0.3)).to eq(1.3)
    end
    
  end
  
  
  describe '#subtract' do
    
    
    
    
  end
  
  describe '#multiply' do
    
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
