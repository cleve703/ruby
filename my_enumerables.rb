module Enumerable
  
  def my_each
    array = Array.new
    i = 0
    while i < self.length
      array.push(yield(self[i]))
      i += 1
    end
    return array
  end

  def my_each_with_index
    return self.length unless block_given?
    hash = Hash.new
    calc = nil
    i = 0 
    while i < self.length
      calc = yield(self[i]).to_s
      hash[calc]=i 
      i += 1
    end
    return hash
  end
  
  def my_select
    array = Array.new
    i = 0
    while i < self.length
      if yield(self[i]) == true
        array.push(self[i])
      end
      i += 1
    end
    return array
  end    

  def my_all?
    i = 0
    result = true
    while i < self.length
      if block_given?
        if yield(self[i]) == false
          result = false
        end
      else
        if self[i] == false
          result = false
        end
      end
      i += 1
    end
    return result
  end

  def my_any?
    i = 0
    result = false
    while i < self.length
      if block_given?
        if yield(self[i]) == true
          result = true
        end
      else
        if self[i] == true
          result = true
        end
      end
      i += 1
    end
    return result
  end

  def my_none?
    i = 0
    result = false
    while i < self.length
      if block_given?
        if yield(self[i]) == false
          result = true
        end
      else
        if self[i] == false
          result = true
        end
      end
      i += 1
    end
    return result
  end

  def my_count
    return self.length unless block_given?
    i = 0
    num_true = 0
    while i < self.length
      if yield(self[i]) == true
        num_true += 1
      end
      i += 1
    end
    return num_true
  end

  def my_map(my_proc=nil)
    return self.length unless block_given?
    i = 0
    array = Array.new
    if my_proc == nil
      while i < self.length
        array.push(yield(self[i]))
        i += 1
      end
    else
      while i < self.length
        array.push(my_proc.call self[i])
    end
    return array
  end

  def my_inject(arg1=nil, arg2=nil)
    arg_array = [arg1, arg2]
    operator = nil
    initial = nil
    arg_array.each do |arg|
      if arg.class == NilClass
      elsif arg.class == Symbol
        operator = arg
      elsif arg.class == Integer || Float
        initial = arg
      end
    end
    self.insert(0, initial) if initial != nil
    i = 0
    memo = self[0]
    if operator == nil
      while i < self.length - 1
        memo = yield(memo,self[i+1])
        i += 1
      end
    else
      while i < self.length - 1
      memo = memo.public_send(operator,self[i+1])
      i += 1
      end
    end
    return memo
  end

end