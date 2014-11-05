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
      v.pick_up_weapon(b)
      expect(v.weapon).to equal(b)
    end

   # Picking up a non-Weapon raises an exception
    it 'raises an exception when picking up a non-weapon' do
      expect{v.pick_up_weapon(Hash.new)}.to raise_error
    end

    # Picking up a new Weapon replaces the Viking's existing weapon
    it "replaces a Viking's existing weapon" do
      axe = Axe.new
      v.pick_up_weapon(Bow.new)
      v.pick_up_weapon(axe)
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
      expect(v).to receive(:take_damage)
      v.receive_attack(10)
    end
    
    
  end


  describe '#attack' do
    let(:opponent){Viking.new}
    # attacking another Viking causes the recipient's health to drop
    it 'causes the recipients health to drop' do
      v.attack(opponent)
      expect(opponent.health).to be < 100
    end
    # attacking another Viking calls that Viking's take_damage method (mock!)
    it 'calls the recipients take_damage method' do
      allow(opponent).to receive(:take_damage).and_return(97.5)
      expect(opponent).to receive(:take_damage)
      v.attack(opponent)
    end

    context 'when attacking with no weapon' do

      it 'runs #damage_with_fists' do
        v.drop_weapon
        allow(v).to receive(:damage_with_fists).and_return(2.5)
        expect(v).to receive(:damage_with_fists)
        v.attack(opponent)
      end

      it 'deals Fists times strength damage' do
        v.drop_weapon
        fists_multiplier = Fists.new.use
        expected_damage = v.strength * fists_multiplier
        expect(opponent).to receive(:receive_attack).with(expected_damage)
        v.attack(opponent)
      end

    end

    context 'when attacking with a weapon' do

      it 'runs #damage_with_weapon' do
        v.pick_up_weapon(Axe.new)
        allow(v).to receive(:damage_with_weapon).and_return(77)
        expect(v).to receive(:damage_with_weapon)
        v.attack(opponent)
      end

      it 'deals damage equal to Vikings strength times weapon multiplier' do
        a = Axe.new
        axe_multiplier = a.use
        v.pick_up_weapon(a)
        expected_damage = axe_multiplier * v.strength

        expect(opponent).to receive(:receive_attack).with(expected_damage)
        v.attack(opponent)
      end

    end

    context 'when using an empty Bow' do
      let(:empty_bow) {Bow.new(0)}
      it 'uses #damage_with_fists instead' do
        v.pick_up_weapon(empty_bow)

        allow(v).to receive(:damage_with_fists).and_return(2.5)
        expect(v).to receive(:damage_with_fists)
        v.attack(opponent)
      end

    end


    it 'raises an error if it kills a Viking' do
      dying_viking = Viking.new("Beowulf", 1)
      allow(v).to receive(:damage_dealt).and_return(100)
      expect { v.attack(dying_viking) }.to raise_error
    end

  end

end
