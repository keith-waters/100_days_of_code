class TrieNode
  attr_accessor :children
  attr_accessor :isEndOfWord
  def initialize
    @children = []
    26.times do
      @children.push(nil)
    end
    @isEndOfWord = false
  end
end

class Trie
  attr_accessor :root
  def initialize
    @root = self.get_node
  end

  def get_node
    TrieNode.new
  end

  def insert(key)
    temp = @root

    for i in (0..key.length-1)
      index = key[i].ord - 'a'.ord
      temp.children[index] = self.get_node if !temp.children[index]
      temp = temp.children[index]
    end

    temp.isEndOfWord = true
  end

  def search(key)
    temp = @root
    for i in (0..key.length-1)
      index = key[i].ord - 'a'.ord # 'a'.ord == 97
      return false if !temp.children[index]
      temp = temp.children[index]
    end
    !temp.nil? && temp.isEndOfWord
  end
end