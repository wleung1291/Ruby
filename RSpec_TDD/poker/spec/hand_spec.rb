require 'rspec'
require 'hand'

describe Hand do 

  let (:hand1) {Hand.new([
    Card.new([2, "2"], "♧"),
    Card.new([5, "5"], "♤"),
    Card.new([4, "4"], "♤"),
    Card.new([8, "8"], "♤"),
    Card.new([6, "6"], "♤")
  ])}
  describe "#high_card" do
    it "high card" do
      expect(hand1.high_card).to eq(true)
    end
  end

####################################################################
  let (:hand2) {Hand.new([
    Card.new([2, "2"], "♧"),
    Card.new([6, "6"], "♤"),
    Card.new([4, "4"], "♤"),
    Card.new([8, "8"], "♤"),
    Card.new([6, "6"], "♤")
  ])}
  describe "#one_pair" do
  it "hand includes one pair" do
      expect(hand2.one_pair).to eq(true)
    end
  end
  
####################################################################
  let (:hand3) {Hand.new([
    Card.new([2, "2"], "♧"),
    Card.new([6, "6"], "♤"),
    Card.new([8, "8"], "♤"),
    Card.new([8, "8"], "♤"),
    Card.new([6, "6"], "♤")
  ])}
  describe "#two_pair" do
  it "hand includes two pairs" do
      expect(hand3.two_pair).to eq(true)
    end
  end

####################################################################
  let (:hand4) {Hand.new([
    Card.new([7, "7"], "♤"),
    Card.new([7, "7"], "♤"),
    Card.new([7, "7"], "♤"),
    Card.new([5, "5"], "♤"),
    Card.new([3, "3"], "♤")
  ])}
  describe "#three_kind" do
  it "hand includes a three of a kind" do
      expect(hand4.three_kind).to eq(true)
    end
  end

####################################################################
  let (:hand6) {Hand.new([
    Card.new([14, "A"], "♤"),
    Card.new([5, "5"], "♧"),
    Card.new([4, "4"], "♤"),
    Card.new([3, "3"], "♧"),
    Card.new([2, "2"], "♤")
  ])}
  describe "#straight" do
  it "hand includes a straight" do
      expect(hand6.straight).to eq(true)
    end
  end

  let (:hand7) {Hand.new([
    Card.new([14, "A"], "♧"),
    Card.new([13, "K"], "♤"),
    Card.new([12, "Q"], "♤"),
    Card.new([11, "J"], "♤"),
    Card.new([10, "10"], "♤")
  ])}
  describe "#straight" do
  it "hand includes a straight" do
      expect(hand7.straight).to eq(true)
    end
  end

  let (:hand8) {Hand.new([
    Card.new([14, "A"], "♧"),
    Card.new([5, "6"], "♤"),
    Card.new([4, "5"], "♤"),
    Card.new([4, "4"], "♤"),
    Card.new([2, "3"], "♤")
  ])}
  describe "#straight" do
  it "hand does not include a straight" do
      expect(hand8.straight).to eq(false)
    end
  end

  ####################################################################
  let (:hand9) {Hand.new([
    Card.new([14, "A"], "♤"),
    Card.new([5, "2"], "♤"),
    Card.new([4, "3"], "♤"),
    Card.new([4, "5"], "♤"),
    Card.new([2, "3"], "♤")
  ])}
  describe "#flush" do
  it "hand includes a flush" do
      expect(hand9.flush).to eq(true)
    end
  end

  let (:hand10) {Hand.new([
    Card.new([14, "A"], "♧"),
    Card.new([5, "2"], "♤"),
    Card.new([4, "3"], "♤"),
    Card.new([4, "5"], "♤"),
    Card.new([2, "3"], "♤")
  ])}
  describe "#flush" do
  it "hand does not include a flush" do
      expect(hand10.flush).to eq(false)
    end
  end  
  
  ####################################################################
  let (:hand11) {Hand.new([
    Card.new([14, "A"], "♤"),
    Card.new([5, "5"], "♤"),
    Card.new([4, "4"], "♤"),
    Card.new([3, "3"], "♤"),
    Card.new([2, "2"], "♤")
  ])}
  describe "#straight_flush" do
  it "hand includes a straight flush" do
      expect(hand11.straight_flush).to eq(true)
    end
  end

  let (:hand12) {Hand.new([
    Card.new([14, "A"], "♧"),
    Card.new([5, "5"], "♤"),
    Card.new([4, "4"], "♤"),
    Card.new([3, "3"], "♤"),
    Card.new([2, "2"], "♤")
  ])}
  describe "#straight_flush" do
  it "hand does not includes a straight flush" do
      expect(hand12.straight_flush).to eq(false)
    end
  end

  ####################################################################
 let (:hand13) {Hand.new([
    Card.new([14, "A"], "♤"),
    Card.new([14, "A"], "♧"),
    Card.new([9, "9"], "♤"),
    Card.new([9, "9"], "♦︎"),
    Card.new([9, "9"], "♥")
  ])}
  describe "#full_house" do
  it "hand includes a full_house" do
      expect(hand13.full_house).to eq(true)
    end
  end

  
  let (:hand14) {Hand.new([
    Card.new([14, "A"], "♤"),
    Card.new([10, "10"], "♧"),
    Card.new([9, "9"], "♤"),
    Card.new([9, "9"], "♦︎"),
    Card.new([9, "9"], "♥")
  ])}
  describe "#full_house" do
  it "hand does not includes a full_house" do
      expect(hand14.full_house).to eq(false)
    end
  end

  let (:hand15) {Hand.new([
    Card.new([7, "7"], "♤"),
    Card.new([7, "7"], "♤"),
    Card.new([7, "7"], "♤"),
    Card.new([5, "5"], "♤"),
    Card.new([5, "5"], "♤")
  ])}
  describe "#full_house" do
  it "hand includes a full_house" do
      expect(hand15.full_house).to eq(true)
    end
  end

  ####################################################################
  let (:hand16) {Hand.new([
    Card.new([7, "7"], "♤"),
    Card.new([7, "7"], "♤"),
    Card.new([7, "7"], "♤"),
    Card.new([7, "7"], "♤"),
    Card.new([5, "5"], "♤")
  ])}
  describe "#four_kind" do
  it "hand includes a four_kind" do
      expect(hand16.four_kind).to eq(true)
    end
  end

  ####################################################################
  let (:hand17) {Hand.new([
    Card.new([14, "A"], "♤"),
    Card.new([13, "K"], "♤"),
    Card.new([12, "Q"], "♤"),
    Card.new([11, "J"], "♤"),
    Card.new([10, "10"], "♤")
  ])}
  describe "#royal_flush" do
  it "hand includes a royal_flush" do
      expect(hand17.royal_flush).to eq(true)
    end
  end

  let (:hand18) {Hand.new([
    Card.new([14, "A"], "♤"),
    Card.new([5, "5"], "♤"),
    Card.new([4, "4"], "♤"),
    Card.new([3, "3"], "♤"),
    Card.new([2, "2"], "♤")
  ])}
  describe "#royal_flush" do
  it "hand does not include a royal_flush" do
      expect(hand18.royal_flush).to eq(false)
    end
  end

  let (:hand19) {Hand.new([
    Card.new([14, "A"], "♤"),
    Card.new([13, "K"], "♤"),
    Card.new([12, "Q"], "♤"),
    Card.new([11, "Q"], "♤"),
    Card.new([9, "9"], "♤")
  ])}
  describe "#royal_flush" do
  it "hand does not include a royal_flush" do
      expect(hand19.royal_flush).to eq(false)
    end
  end
  
end