class TwoStacks
  attr_accessor :stack_1
  attr_accessor :stack_2

  def initialize
    @stack_1 = []
    @stack_2 = []
  end

  def enqueue(i)
    @stack_1.push(i)
  end

  def dequeue
    @stack_1.length.times { @stack_2.push(@stack_1.pop) }
    num = @stack_2.pop
    @stack_2.length.times { @stack_1.push(@stack_2.pop) } if @stack_2.length > 0
    num
  end
end