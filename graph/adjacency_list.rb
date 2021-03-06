require 'set'

class AdjacencyList
  attr_accessor :array

  def initialize
    # default hash values
    # @hash = Hash.new { |hash, key| hash[key] = [] }
    @array = []
    @int_max = Float::INFINITY
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


  def add_edge_object(source, dest, weight)
    @array[source] = [] unless @array[source]
    @array[dest] = [] unless @array[dest]
    @array[source].push({dest: dest, weight: weight})
    @array[dest].push({dest: source, weight: weight})
  end
  def min_distance(distances, shortest_path)
    min = @int_max #a big number?
    min_index = -1
    distances.each_with_index do |value, index|
      if !shortest_path[index] && value <= min
        min = value
        min_index = index
      end
    end
    min_index
  end 

  def get_weight(source, dest)
    weight = @int_max
    @array[source].each { |i| weight = i[:weight] if i[:dest] == dest }
    weight
  end
    
  def dijkstra(src)
    distances = Array.new(@array.length, @int_max)
    shortest_path = Array.new(@array.length, false)
    distances[src] = 0

    count = 0
    while count < @array.length-1
      closest = min_distance(distances, shortest_path)
      shortest_path[closest] = true
    
      v = 0
      while v < @array.length
        if !shortest_path[v] && get_weight(closest, v) > 0 && distances[closest] + get_weight(closest, v) < distances[v]
          distances[v] = distances[closest] + get_weight(closest, v)
        end
        v+=1
      end    
      count+=1
    end

    distances
  end
end