require 'weapons/bow'

describe Bow do
  let(:b) {Bow.new}

  describe '#initialize' do
    it 'defaults to starting with 10 arrows' do
      expect(b.arrows).to eq(10)
    end
    
    it 'can start with a specified number of arrows' do
      small_bow = Bow.new(5)
      expect(small_bow.arrows).to eq(5)
    end
  end

  describe '#arrows' do
    
    it 'allows you to read the arrow count' do
      expect(b.arrows).to be_a(Integer)
    end
  end
  
  describe '#use' do
    it 'reduces the number of arrows by 1' do
      b.use
      expect(b.arrows).to eq(9)
    end
    
    it 'throws an error if arrows were 0' do
      empty_bow = Bow.new(0)
      expect{empty_bow.use}.to raise_error
    end
    
  end
  
end
