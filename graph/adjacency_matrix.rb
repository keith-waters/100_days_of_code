require 'set'

class AdjacencyMatrix
  
  def initialize(graph)
    @int_max = Float::INFINITY
    @graph = graph
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
    
  def dijkstra(src)
    distances = Array.new(@graph.length, @int_max)
    shortest_path = Array.new(@graph.length, false)
    distances[src] = 0

    count = 0
    while count < @graph.length-1
      closest = min_distance(distances, shortest_path)
      shortest_path[closest] = true
    
      v = 0
      while v < @graph.length
        if !shortest_path[v] && @graph[closest][v] > 0 && distances[closest] + @graph[closest][v] < distances[v]
          distances[v] = distances[closest] + @graph[closest][v]
        end
        v+=1
      end    
      count+=1
    end
    distances
  end
end