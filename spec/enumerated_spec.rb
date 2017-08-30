require "enumerated"

describe "my_each" do
  context "given an array and no block" do
    it "returns the array" do
      expect([1,2,3,4].my_each{|i|}).to eql([1,2,3,4])
    end
  end
end

describe "my_each_with_index" do
  context "given an array of numbers" do
    before(:each) do
      @nums = [1,2,3,4]
    end

    context "without a block" do
      it "doesn't modify the original array" do
        expect(@nums.my_each_with_index {|i,x|}).to eql(@nums)
      end
    end

    context "with a block" do
      it "modifies the original array as prescribed" do
        expect(@nums.my_each_with_index {|i,x| @nums[x] = i*2}).to eql([2,4,6,8])
      end
    end
  end
end

describe "my_count" do
  context "given an array of numbers" do
    it "returns the length of the array" do
      expect([1,2,3,4].my_count).to eql(4)
    end
  end

  context "given an empty array" do
    it "returns zero" do
      expect([].my_count).to eql(0)
    end
  end
end

describe "my_none?" do
  context "given an array of strings" do
    before(:all) do
      @nums = ["1","2","3","4"]
    end
    context "given a test for an absent string" do
      it "returns true" do
        expect(@nums.my_none?{|x| x=="Dog"}).to eql(true)
      end
    end
    context "given a test for a present string" do
      it "returns false" do
        expect(@nums.my_none?{|x| x=="4"}).to eql(false)
      end
    end

    context "given an empty block" do
      it "returns true" do
        expect(@nums.my_none?{|x|}).to eql(true)
      end
    end

    context "given an integer that resembles a present" do
      it "returns true" do
        expect(@nums.my_none?{|x| x == 4}).to eql(true)
      end
    end
  end
end

describe "my_any?" do
  context "given an array of strings" do
    before(:all) do
      @nums = ["1","2","3","4"]
    end
    context "given a test for an absent string" do
      it "returns false" do
        expect(@nums.my_any?{|x| x=="Dog"}).to eql(false)
      end
    end
    context "given a test for a present string" do
      it "returns true" do
        expect(@nums.my_any?{|x| x=="4"}).to eql(true)
      end
    end

    context "given an empty block" do
      it "returns false" do
        expect(@nums.my_any?{|x|}).to eql(false)
      end
    end

    context "given an integer that resembles a present" do
      it "returns false" do
        expect(@nums.my_any?{|x| x == 4}).to eql(false)
      end
    end
  end
end

describe "my_select" do
  context "given an array of integers" do
    before(:all) do
      @nums = [1,2,3,4]
    end
    context "given a test for an absent integer" do
      it "returns an empty array" do
        expect(@nums.my_select{|x| x=="Dog"}).to eql([])
      end
    end

    context "given the block 'x > 2'" do
      it "returns the array [3,4]" do
        expect(@nums.my_select{|x| x > 2}).to eql([3,4])
      end
    end

    context "given the block 'x > 0'" do
      it "returns the array [1,2,3,4]" do
        expect(@nums.my_select{|x| x > 0}).to eql([1,2,3,4])
      end
    end

    context "given an empty block" do
      it "returns an empty array" do
        expect(@nums.my_select{|x|}).to eql([])
      end
    end

    context "given the block 'x'" do
      it "returns the array [1,2,3,4]" do
        expect(@nums.my_select{|x| x}).to eql([1,2,3,4])
      end
    end

    context "given the block 'true'" do
      it "returns the array [1,2,3,4]" do
        expect(@nums.my_select{|x| true}).to eql([1,2,3,4])
      end
    end
  end
end
