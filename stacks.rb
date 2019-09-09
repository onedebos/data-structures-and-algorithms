# frozen_string_literal: true

# Create Node
class Node
  attr_accessor :val, :next_node
  def initialize(val, next_node = nil)
    @val = val
    @next_node = next_node
  end
end

# Create Stack blueprint
class Stack
  # stacks are LIFO (last-in-first-out)
  # elements are always added and removed from the top
  # of the stack

  # add data to the stack
  def push(value)
    if @top.nil?
      @top = Node.new(value)
    else
      new_node = Node.new(value)
      new_node.next_node = @top
      @top = new_node
    end
  end

  # remove data from the stack
  def pop
    top_node = @top
    @top = top_node.next_node
  end

  # check if stack is empty
  def empty?
    if @top.nil?
      true
    else
      false
    end
  end
end
# written by Debs

stack = Stack.new
stack.push(3)
stack.push(4)
stack.push(5)
stack.push(6)
stack.pop
puts stack.empty?

p stack
