class AdjacencyList
  attr_accessor :hash

  def initialize
    @hash = Hash.new { |hash, key| hash[key] = []}
  end

  def add_edge(source, dest)
    @hash[source].push(dest) 
  end

  def print_graph
    @hash.each { |key, value| puts "#{key} -> #{value.join(" -> ")}" }
  end

  def breath_first_search(vertex)
    arr = []
    visited = [false] * @hash.size
    queue = []
    visited[vertex] = true
    queue.push(vertex)
    
    while !queue.empty?
      temp = queue.shift
      arr.push(temp)
    
      @hash[temp].each do |i| 
        unless visited[i] 
          visited[i] = true
          queue.push(i) 
        end
      end
    end
    arr
  end

  def depth_first_search(num)
    arr = []
    # can use a Set of vertices for visited
    visited = Array.new(@hash.size, false)

    recur = lambda do |index|
      visited[index] = true
      arr.push(index)
      @hash[index].each do |value|
        recur.call(value) if !visited[value]
      end
    end

    recur.call(num)
    arr
  end

  def depth_first_iterative(vertex)
    arr = []
    visited = [false] * @hash.size
    stack = []
    visited[vertex] = true
    stack.push(vertex)
    
    while !stack.empty?
      temp = stack.pop
      arr.push(temp)
    
      @hash[temp].each do |i| 
        unless visited[i] 
          visited[i] = true
          stack.push(i) 
        end
      end
    end
    arr
  end

end