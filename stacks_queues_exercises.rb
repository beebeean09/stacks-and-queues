class MyQueue

  def initialize
    @store = []
  end

  def enqueue(el)
    @store.push(el)
  end

  def dequeue
    raise "Queue is empty." if empty?
    @store.shift
  end

  def peek
    raise "Queue is empty." if empty?
    @store[0]
  end

  def size
    @store.length
  end

  def empty?
    size == 0
  end
end

# daphne = MyQueue.new
# daphne.enqueue(6)
# p daphne.peek
# p daphne.dequeue
# p daphne.empty?

class MyStack

  def initialize
    @store = []
  end

  def pop
    raise "Stack is empty." if empty?
    @store.pop
  end

  def push(el)
    @store.push(el)
  end

  def peek
    raise "Stack is empty." if empty?
    @store[0]
  end

  def size
    @store.length
  end

  def empty?
    size == 0
  end

end

# daphne = MyStack.new
# daphne.push(8)
# p daphne.peek
# p daphne.pop
# p daphne.empty?

class StackQueue

  def initialize
    @front = MyStack.new
    @back = MyStack.new
  end

  def enqueue(el)
    @back.push(el)
  end

  def dequeue
    raise "StackQueue empty" if empty?
    if @front.empty?
      until @back.empty?
        @front.push(@back.pop)
      end
    end

    @front.pop
  end

  def size
    @front.size + @back.size
  end

  def empty?
    size == 0
  end
end

# class MaxStack
#
#   def initialize
#     @store = [nil]
#   end
#
#   def pop
#     raise "Stack is empty." if empty?
#     @store[1], @store[-1] = @store[-1], @store[1]
#     biggest = @store.pop
#
#     parent_idx = 1
#     children = children(parent_idx)
#
#     while children.length > 0 && children.any? { |child_index| @store[child_index] > @store[parent_idx]}
#       max_child_idx = children.sort_by { |idx| @store[idx] }[-1]
#       @store[parent_idx], @store[max_child_idx] = @store[max_child_idx], @store[parent_idx]
#       parent_idx = max_child_idx
#       children = children(parent_idx)
#     end
#
#     biggest
#   end
#
#   def children(idx)
#     [idx * 2, idx * 2 + 1].select { |child| child < size - 1 }
#   end
#
#   def push(el)
#     @store.push(el)
#     child_idx = @store.length - 1
#     parent_idx = child_idx/2
#     while parent_idx >= 1 && @store[parent_idx] < el
#       @store[parent_idx], @store[child_idx] = @store[child_idx], @store[parent_idx]
#       child_idx, parent_idx = parent_idx, parent_idx/2
#     end
#   end
#
#   def peek
#     raise "Stack is empty." if empty?
#     @store[0]
#   end
#
#   def max
#     @store[1]
#   end
#
#   def size
#     @store.length
#   end
#
#   def empty?
#     size == 1
#   end
#
# end
#
#
# class MinStack
#
#   attr_accessor :store
#
#   def initialize
#     @store = [nil]
#   end
#
#   def pop
#     raise "Stack is empty." if empty?
#     @store[1], @store[-1] = @store[-1], @store[1]
#     smallest = @store.pop
#
#     parent_idx = 1
#     children = children(parent_idx)
#
#     while children.length > 0 && children.any? { |child_index| @store[child_index] < @store[parent_idx]}
#       min_child_idx = children.sort_by { |idx| @store[idx] }[0]
#       @store[parent_idx], @store[min_child_idx] = @store[min_child_idx], @store[parent_idx]
#       parent_idx = min_child_idx
#       children = children(parent_idx)
#     end
#
#     smallest
#   end
#
#   def children(idx)
#     [idx * 2, idx * 2 + 1].select { |child| child < size - 1 }
#   end
#
#   def push(el)
#     @store.push(el)
#     child_idx = @store.length - 1
#     parent_idx = child_idx/2
#     while parent_idx >= 1 && @store[parent_idx] > el
#       @store[parent_idx], @store[child_idx] = @store[child_idx], @store[parent_idx]
#       child_idx, parent_idx = parent_idx, parent_idx/2
#     end
#   end
#
#   def peek
#     raise "Stack is empty." if empty?
#     @store[0]
#   end
#
#   def max
#     @store[1]
#   end
#
#   def size
#     @store.length
#   end
#
#   def empty?
#     size == 1
#   end
#
# end



class MinMaxStack

  def initialize
    @max_element = nil
    @min_element = nil
    @store = []
  end

  def push(el)
    @store.push(el)
    @max_element = el if @max_element.nil? || @max_element < el
    @min_element = el if @min_element.nil? || @min_element > el
  end

  def pop
    raise "Stack is empty!" if empty?
    popped = @store.pop

    @max_element = @store.max if popped == @max_element
    @min_element = @store.max if popped == @min_element

    popped
  end

  def size
    @store.length
  end

  def empty?
    size == 0
  end

  def max
    raise 'Stack is empty!' if empty?
    @max_element
  end

  def min
    raise 'Stack is empty!' if empty?
    @min_element
  end

end

class MinMaxStackQueue

  attr_reader :front, :back

  def initialize
    @front = MinMaxStack.new
    @back = MinMaxStack.new
  end

  def enqueue(el)
    @back.push(el)
  end

  def dequeue
    raise "MinMaxStackQueue empty" if empty?

    if @front.empty?
      until @back.empty?
        @front.push(@back.pop)
      end
    end

    @front.pop
  end

  def max
    raise "MinMaxStackQueue empty" if empty?
    return @back.max if @front.empty?
    return @front.max if @back.empty?
    [@front.max, @back.max].max
  end

  def min
    raise "MinMaxStackQueue empty" if empty?
    return @back.min if @front.empty?
    return @front.min if @back.empty?
    [@front.min, @back.min].min
  end

  def empty?
    @front.empty? && @back.empty?
  end

end

daphne = MinMaxStackQueue.new

15.times do
  daphne.enqueue(rand(100))
end

p daphne.front
p daphne.back

10.times do
  p daphne.dequeue
  puts "max: #{daphne.max}"
  puts "min: #{daphne.min}"
end
