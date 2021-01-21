require 'set'

class AdjacencyList
  attr_accessor :array

  def initialize
    # default hash values
    # @hash = Hash.new { |hash, key| hash[key] = [] }
    @array = []
  end

  def add_edge(source, dest)
    @array[source] = [] unless @array[source]
    # check dest, just in case its never added as a source
    @array[dest] = [] unless @array[dest]
    @array[source].push(dest)
  end

  def print_graph
    # @hash.each { |key, value| puts "#{key} -> #{value.join(" -> ")}" }
    @array.each_with_index { |list, index| puts "#{index} -> #{list.join(" -> ")}"}
  end

  def breadth_first_traversal(vertex)
    arr = []
    visited = Set[vertex]
    queue = []
    queue.push(vertex)

    while !queue.empty?
      temp = queue.shift
      arr.push(temp)

      @array[temp].each do |i|
        unless visited.include?(i)
          visited.add(i)
          queue.push(i)
        end
      end
    end
    arr
  end

  def depth_first_search(num)
    arr = []
    visited = Set[]

    recur = ->(index) { 
      visited.add(index)
      arr.push(index)
      @array[index].each { |value| recur.call(value) unless visited.include?(value) }
    }
    recur.call(num)
    arr
  end

  def depth_first_iterative(vertex)
    arr = []
    visited = Set[vertex]
    stack = [vertex]

    while !stack.empty?
      temp = stack.pop
      arr.push(temp)

      @array[temp].each do |i|
        unless visited.include?(i)
          visited.add(i)
          stack.push(i)
        end
      end
    end
    arr
  end
end