module Fibonacci
  def self.fib(memo, position)
    return [1, memo] if position == 0 || position == 1
    return [memo[position], memo] if memo.key?(position)

    cur, memo_cur = fib(memo, position - 1)
    prev, memo_prev = fib(memo_cur, position - 2)
    result = cur + prev

    [result, memo_prev.merge(position => result).freeze]
  end

  def self.calculate_fibonacci(position)
    result, = fib({}.freeze, position)
    result
  end
end

position = 400
result = Fibonacci.calculate_fibonacci(position)
puts "Fibonacci number at position #{position} is: #{result}"
