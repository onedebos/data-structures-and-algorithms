# frozen_string_literal: true

# class creates a Node
class Node
  attr_accessor :val, :next_node

  def initialize(val, next_node = nil)
    @val = val
    @next_node = next_node
  end
end

# class creates a Queue
class Queue
  # Queues are FIFO ( first-in-first-out)
  def push(value)
    new_node = Node.new(value)
    if @first.nil?
      @first = new_node
    else
      current_node = @first
      current_node = current_node.next_node until current_node.next_node.nil?
      current_node.next_node = new_node
    end
  end

  # removes the earliest item in the queue
  def pop
    current_node = @first
    @first = current_node.next_node
  end
end

queue = Queue.new
queue.push(3)
queue.push(4)
queue.push(5)
queue.pop
queue.pop
p queue
