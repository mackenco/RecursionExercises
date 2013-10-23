def r_range(start_num, end_num)
    [start_num].tap do |new_arr|
      unless start_num == end_num
        new_arr << r_range(start_num +1, end_num)
      end
    end.flatten
  end

class Array
  def r_sum
    num = self[0]
    num += self[1..-1].r_sum unless self.length == 1
    num
  end

  def i_sum
    self.inject(:+)
  end
end

def exp1(number,exponent)
  if exponent == 0
    return 1
  else
    number *= exp1(number,exponent-1)
  end
end

def exp2(number,exponent)
  if exponent == 0
    return 1
  elsif exponent.even?
    temp_num = exp2(number,exponent / 2)
    temp_num *= temp_num
  elsif exponent.odd?
    temp_num = exp2(number,(exponent - 1) / 2)
    temp_num *= temp_num
    temp_num *= number
  else
    p "DON'T USE FRACTIONAL EXPONENTS FOR THIS!"
  end
  temp_num
end

class Array
  def deep_dup
    self.map do |element|
      if element.is_a? (Array)
        element.deep_dup
      elsif element.is_a?(Fixnum)
        element
      else
        element.dup
      end
    end
  end
end

def r_fibonacci(number)
  if number == 1
    [1]
  elsif number == 2
    [1,1]
  else
    temp_fib = r_fibonacci(number-1)
    temp_fib << (temp_fib[-2] + temp_fib[-1])
  end
end

def i_fibonacci(number)
  fibo = [1,1]
  (number - 2).times {fibo << fibo[-1] + fibo[-2]}
  fibo
end


if __FILE__ == $0
  p r_range(1, 10)
  p (1..10).to_a.r_sum
  p (1..10).to_a.i_sum

  p exp1(2,10) # 1024
  p exp2(2,10) # 1024

  a = [[[1,2],[3,4]],[[7,8],[9,10]]]
  b = a.dup
  c = a.deep_dup

  c[0][0][0] = '99'
  p a
  p c

  b[0][0][0] = '99'
  p a
  p b

  p r_fibonacci(10)
  p i_fibonacci(10)
end