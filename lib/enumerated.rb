module Enumerable
  def my_each()
    result = []
    top_end = (self.length) - 1

    for i in 0..top_end do
      yield(self[i])
    end
    self
  end

  def my_each_with_index()
    result = []
    top_end = (self.length) - 1

    for i in 0..top_end do
      yield(self[i], i)
    end
    self
  end

  def my_select()
    result = []
    self.my_each do |x|
      if yield(x)
        result.push(x)
      end
    end
    return result
  end

  def my_all?()
    result = true
    self.my_each do |x|
      if yield(x) == false
        result = false
      end
    end
    return result
  end

  def my_any?()
    result = false
    self.my_each do |x|
      if yield(x) == true
        result = true
      end
    end
    return result
  end

  def my_none?()
    result = false
    self.my_each do |x|
      if yield(x) == true
        result = true
      end
    end
    if result==true
      return false
    else
      return true
    end
  end

  def my_count
    self.length
  end

  def my_count(criteria=nil)
    if criteria != nil
      count = 0

      self.my_each do |i|
        if i == criteria
          count += 1
        end
      end

      if block_given?
        p "warning: given block not used"
      end

      return count
    elsif block_given?
      count = 0

      self.my_each do |i|
        if yield(i) == true
          count += 1
        end
      end

      return count
    else
      self.length
    end
  end

  def my_map(run_this = nil)
    result = []
    top_end = (self.length) - 1

    for i in 0..top_end do
      if run_this != nil
        result.push(run_this.call(self[i]))
      else
        result.push(yield(self[i]))
      end
    end
    result
  end

  def my_inject(*args)
    memo = nil
    if args[0].class == Symbol
      self.my_each do |i|
        memo = memo.send args[0], i unless memo == nil
        memo = i if memo == nil
      end
    else
      memo = args[0]
      if args[1].class == Symbol
        self.my_each do |i|
          memo = memo.send args[1], i unless memo == nil
          memo = i if memo == nil
        end
      end
    end
    if block_given?
      self.my_each do |i|
        memo = yield(memo, i) unless memo == nil
        memo = i if memo == nil
      end
    end
    memo
  end

  def multiply_els(arrghy)
    arrghy.my_inject(:*)
  end
end
