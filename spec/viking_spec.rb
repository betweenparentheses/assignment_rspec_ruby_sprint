require 'viking'

describe Viking do
  let(:v) {Viking.new}


  describe '#initialize' do 
    # Passing a name to a new Viking sets that name attribute
    it 'sets a custom name' do
      hrothgar = Viking.new("Hrothgar")
      expect(hrothgar.name).to eq("Hrothgar")
    end
    
    # Passing a health attribute to a new Viking sets that health attribute
    it 'sets a custom health attribute' do
      unhealthy_hrothgar = Viking.new("Hrothgar", 3)
      expect(unhealthy_hrothgar.health).to eq(3)
    end
    
    # A Viking's weapon starts out nil by default
    it 'defaults to setting weapon to nil' do
      expect(v.weapon).to equal(nil)
    end
  end
  
  describe '#health' do
    
    # health cannot be overwritten after it's been set on initialize
    it 'cannot be overwritten after it is set on initialize' do
      expect{v.health = 20}.to raise_error(NoMethodError)
    end
    
  end
  
  describe '#pick_up_weapon' do
    
    # Picking up a Weapon sets it as the Viking's weapon
    it "sets a weapon as the Viking's weapon" do
      b = Bow.new
      v.pick_up(b)
      expect(v.weapon).to equal(b)
    end

   # Picking up a non-Weapon raises an exception
    it 'raises an exception when picking up a non-weapon' do
      expect{v.pick_up(Hash.new)}.to raise_error
    end

    # Picking up a new Weapon replaces the Viking's existing weapon
    it "replaces a Viking's existing weapon" do
      axe = Axe.new
      v.pick_up(Bow.new)
      v.pick_up(axe)
      expect(v.weapon).to equal(axe)
    end
    
  end
  
  describe '#drop_weapon' do
    # Dropping a Viking's weapon leaves the Viking weaponless
    it 'removes any existing weapons' do
      axey = Viking.new("Axey McGee", 12, 150, Axe.new)
      axey.drop_weapon
      expect(axey.weapon).to equal(nil)
    end
  end
 
  describe '#receive_attack' do
    
    it "reduces a Viking's health by a specified amount" do
      vike = Viking.new("TenHealth", 10)
      vike.receive_attack(3)
      expect(vike.health).to eq(7)
    end
    
    it 'calls the take_damage method' do
      allow(v).to receive(:take_damage).and_return(90)
      expect(v).to receive(:take_damage).with(10).and_return(90)
      v.receive_attack(10)
    end
    
    
  end


  describe '#attack' do
    # attacking another Viking causes the recipient's health to drop
    # attacking another Viking calls that Viking's take_damage method (mock!)
    # attacking with no weapon runs damage_with_fists (mock!)
    # attacking with no weapon deals Fists multiplier times strength damage
    # attacking with a weapon runs damage_with_weapon (mock!)
    # attacking with a weapon deals damage equal to the Viking's strength times that Weapon's multiplier
    # attacking using a Bow without enough arrows uses Fists instead (mock!)
    # Killing a Viking raises an error
  end

end
