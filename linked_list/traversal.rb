class Node
  attr_accessor :value
  attr_accessor :next
  def initialize(value)
    @value = value
    @next = nil
  end
end

class Traversal
  def traverse(head)
    ans = []
    temp = head
    while !temp.nil?
      ans.push(temp.value)
      temp = temp.next
    end
    p ans
  end

  def unshift(val, head)
    node = Node.new(val)
    node.next = head
    node
  end

  def insert(val, head, prev_node_value)
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
    head
  end

  def push(val, head)
    node = Node.new(val)
    temp = head
    while !temp.nil? 
      if temp.next.nil?
        temp.next = node
        break
      end
      temp = temp.next
    end
    head
  end

  def remove(val, head)
    temp = head
    while !temp.nil? 
      if temp.next.value == val
        temp.next = temp.next.next
        break
      end
      temp = temp.next
    end
    head
  end

  def remove_at_position(pos, head)
    temp = head
    return head.next if pos == 1

    for i in (2..pos-1)
      temp = temp.next
    end
    temp.next = temp.next.next
    head
  end

  def length_iterative(head)
    temp = head
    count = 0
    while !temp.nil?
      temp = temp.next
      count+=1
    end
    count
  end

  def length_recursive(head)
    if head.nil?
      return 0
    else
      return 1+length_recursive(head.next)
    end
  end
end