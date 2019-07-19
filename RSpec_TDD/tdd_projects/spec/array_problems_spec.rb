require 'rspec'
require 'array_problems'

  describe "#my_uniq" do
    let(:arr) { [1,2,3,1] }
    subject(:return_arr) {my_uniq(arr)}

    it "removes duplicates" do
      arr.each do |ele|
        expect(return_arr.count(ele)).to eq(1)
      end
    end

    it "does not modify the original array" do
      expect{my_uniq(arr)}.to_not change{arr}
    end

  end

  ####################################################################
  describe "#two_sum" do 
    let(:arr) {[-1, 0, 2, -2, 1, 1, 0]}
    subject(:return_arr) {two_sum(arr)}

    it "finds all possible pair(s)" do
      expect(return_arr).to eq([[0, 4], [0, 5], [1, 6], [2, 3]]) 
    end

    it "all pair(s) sum to 0" do
      return_arr.each do |pair|
        expect(arr[pair[0]] + arr[pair[1]]).to eq(0)
      end
    end

  end

####################################################################
  describe "#my_transpose" do
    let(:arr1) { 
        [[0, 1, 2],
         [3, 4, 5],
         [6, 7, 8],
         [9, 10, 11]]
      }
    let(:arr2) { 
        [[0, 1, 2],
         [3, 4, 5],
         [6, 7, 8]]
    }
    let(:arr3) { 
        [[0, 1, 2, 3],
         [4, 5, 6, 7],
         [8, 9, 10, 11]]
    }
        
    subject(:return_arr1) {my_transpose(arr1)}
    subject(:return_arr2) {my_transpose(arr2)}
    subject(:return_arr3) {my_transpose(arr3)}

    it "transposes the array" do
      expect(return_arr1).to eq(
        [[0, 3, 6, 9],
         [1, 4, 7, 10],
         [2, 5, 8, 11]])
    end

    it "transposes the array" do
      expect(return_arr2).to eq(
        [[0, 3, 6],
         [1, 4, 7],
         [2, 5, 8]])
    end

    it "transposes the array" do
      expect(return_arr3).to eq(
        [[0, 4, 8],
         [1, 5, 9],
         [2, 6, 10],
         [3, 7, 11]])
    end

  end

####################################################################
  describe "#stock_picker" do
    let(:arr) {[5, 7, 4, 3, 5, 1, 2, 6]}
    subject(:sp) { stock_picker(arr) }
    it "find a better pair" do
      expect(sp).to eq([5, 7])
    end 

    let(:arr2) {[1, 2, 3, 4, 5, 4]}
    subject(:sp2) { stock_picker(arr2)}
    it "find the best pair" do
      expect(sp2).to eq([0, 4])
    end 

    let(:arr3) {[5, 5, 4, 3, 2, 1]}
    subject(:sp3) { stock_picker(arr3)}
    it "does not buy on the dip" do
      expect(sp3).to eq([])
    end
         
  end


