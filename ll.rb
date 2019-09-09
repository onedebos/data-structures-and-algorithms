# frozen_string_literal: true

# Node BluePrint
class Node
  attr_accessor :val, :next_node
  def initialize(val, next_node = nil)
    @val = val
    @next_node = next_node
  end
end

# LinkedList BluePrint
class LinkedList
  # add to the end of the list
  def push(value)
    if @head.nil?
      @head = Node.new(value)
      current_node = @head
    else
      current_node = @head
      current_node = current_node.next_node until current_node.next_node.nil?
      current_node.next_node = Node.new(value)
      current_node = current_node.next_node
    end
    current_node
  end

  # method removes item at the end of the list
  def pop
    current_node = @head
    if current_node.next_node.nil?
      @head.nil?
    else
      while current_node.next_node
        previous = current_node
        current_node = current_node.next_node
      end
      previous.next_node = nil
    end
  end

  # method removes item at the beginning of the list
  def shift
    current_node = @head
    @head = current_node.next_node
  end

  # method to add at the beginning of the list
  def unshift(val)
    if @head.nil?
      @head = @tail = Node.new(val)
    else
      new_node = Node.new(val)
      new_node.next_node = @head
      @head = new_node
    end
  end

  # method to get value at a given index
  def get_val_at_index(index)
    if index_valid?(index)
      current_node = @head
      i = 0
      while i < index
        current_node = current_node.next_node
        i += 1
      end
      current_node.val
    end
  end

  # method to add at a given index
  def add_at_index(index, value)
    # if index is 0, add to the beginning of the list else
    # traverse the list till you get to index
    # create a new node with the value
    # set the next node of the new node to the next node of the current node
    # set the next node of the previous node to the new node
    if index.zero?
      unshift(value)
    elsif index_valid?(index)
      new_node = Node.new(value)
      current_node = @head
      i = 0
      while i < index
        previous_node = current_node
        current_node = current_node.next_node
        i += 1
      end
      new_node.next_node = current_node
      previous_node.next_node = new_node
    end
  end

  def set(index, value)
    current_node = @head
    i = 0
    while i < index
      current_node = current_node.next_node
      i += 1
    end
    current_node.val = value
  end

  def remove(index)
    current_node = @head
    i = 0
    while i < index
      previous_node = current_node
      current_node = current_node.next_node
      i += 1
    end
    temp_node = current_node.next_node
    previous_node.next_node = temp_node
  end

  # NOT WORKING!
  def reverse_list
    node = @head
    @head = @tail
    @tail = node
    prev = nil

    (0..length).each do |_i|
      next_item = node.next_node
      node.next_item = prev
      prev = node
      node = next_item
    end
  end

  # helper methods

  # method checks if index exists
  def index_valid?(index)
    index > -1 && index != length ? true : false
  end

  # method to get the length of the list
  def length
    current_node = @head
    count = 1
    until current_node.next_node.nil?
      current_node = current_node.next_node
      count += 1
    end
    count
  end
end

list = LinkedList.new
list.push(3)
list.push(4)
list.push(5)
list.push(6)
list.set(2, 20)
# list.reverse_list
# list.add_at_index(0,24)

# list.pop
# list.unshift(7)
# puts list.length
# puts list.get_val_at_index(3)
# list.remove(2)

p list
