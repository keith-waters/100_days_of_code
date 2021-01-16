class Node
  attr_accessor :value
  attr_accessor :next
  def initialize(value)
    @value = value
    @next = nil
  end
end

class LinkedList
  attr_accessor :head

  def initialize(arr)
    @head = Node.new(arr[0])

    prev = @head 
    current = nil
    for i in (1..arr.length-1)
      current = Node.new(arr[i])
      prev.next = current
      prev = current
    end
  end

  def traverse
    ans = []
    temp = head
    while !temp.nil?
      ans.push(temp.value)
      temp = temp.next
    end
    ans
  end

  def unshift(val)
    node = Node.new(val)
    node.next = head
    @head = node
  end

  def insert(val, prev_node_value)
    node = Node.new(val)
    prev_node = nil
    temp = head

    while !temp.nil?
      if temp.value == prev_node_value
        prev_node = temp
        break
      end
      temp = temp.next
    end
    node.next = prev_node.next
    prev_node.next = node
  end

  def push(val)
    temp = head
    while true 
      if temp.next.nil?
        temp.next = Node.new(val)
        break
      end
      temp = temp.next
    end
  end

  def remove(val)
    temp = head
    while true
      if temp.next.value == val
        temp.next = temp.next.next
        break
      end
      temp = temp.next
    end
  end

  def remove_at_position(pos)
    # position is 0 indexed
    if pos == 0
      @head = @head.next 
      return
    end

    temp = head
    i = 1
    while i < pos
      temp = temp.next
      i+=1
    end
    temp.next = temp.next.next
  end

  def length_iterative
    temp = head
    length = 0
    while !temp.nil?
      temp = temp.next
      length+=1
    end
    length
  end

  def length_recursive(head = @head)
    return 0 if head.nil?
    1+length_recursive(head.next)
  end

  def reverse_with_stack
    stack = []
    temp = head

    while !temp.nil?
      stack.push(temp)
      temp = temp.next
    end

    @head = stack.pop
    @head.next = nil
    prev = @head

    while !stack.empty?
      prev.next = stack.pop
      prev.next.next = nil
      prev = prev.next
    end
  end

  def reverse_iterative
    # Initialize three pointers prev as NULL, curr as head and next as NULL.
    # Iterate through the linked list. In loop, do following. 
    # // Before changing next of current, 
    # // store next node 
    # next = curr->next
    # // Now change next of current 
    # // This is where actual reversing happens 
    # curr->next = prev 
    # // Move prev and curr one step forward 
    # prev = curr 
    # curr = next
    prev = nil
    current = @head
    upcoming = nil

    while !current.nil?
      upcoming = current.next
      current.next = prev
      prev = current
      current = upcoming 
    end
    @head = prev
  end
end