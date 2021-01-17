class TrieNode
  attr_accessor :children, :end_of_word
  def initialize
    @children = [].fill(nil, 0, 26)
    @end_of_word = false
  end
end

class Trie
    attr_accessor :root
    def initialize
      @root = get_node
    end

    def get_node
      TrieNode.new
    end

    def insert(key)
      temp = @root
      i = 0 
      while i < key.length
        index = key[i].ord - 97
        temp.children[index] = get_node unless temp.children[index]
        temp = temp.children[index]
        i+=1
      end
      temp.end_of_word = true
    end

    def search(key)
      temp = @root
      key.chars.each_with_index do |c,i|
        index = key[i].ord - 97
        return false unless temp.children[index]
        temp = temp.children[index]
      end
      !temp.nil? && temp.end_of_word
    end

    def remove(key, current=@root, depth=0)
      return if current.nil?

      if depth == key.chars.length
        current.end_of_word = false if current.end_of_word
        current = nil if current.children.empty?
        return current
      end
  
      index = key[depth].ord - 97
      current.children[index] = remove(key, current.children[index], depth+1)
      current = nil if current.children.empty? && current.end_of_word == false
      current
    end

  def display(string=[], level=0, current=@root, arr=[])
    if current.end_of_word
      arr.push(string.slice(0,level).join)
    end
  
    for i in (0..25)
      if current.children[i]
        string[level] = (i + 97).chr
        display(string, level+1, current.children[i], arr)
      end
    end
    arr
  end
end