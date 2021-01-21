require 'set'

class AdjacencyMatrix
  
  def initialize(graph)
    @int_max = 9999999999
    @graph = graph
  end

  # // A utility function to find the vertex with minimum distance value, from 
  # // the set of vertices not yet included in shortest path tree 
  def min_distance(distances, shortest_path)
    min = @int_max #a big number?
    min_index = -1
  # int minDistance(int dist[], bool sptSet[]) 
  # { 
  #     // Initialize min value 
  #     int min = INT_MAX, min_index; 
    
    for v in (0..@graph.length-1)
  #     for (int v = 0; v < V; v++) 
      if !shortest_path[v] && distances[v] <= min
        min = distances[v]
        min_index = v
      end
  #         if (sptSet[v] == false && dist[v] <= min) 
  #             min = dist[v], min_index = v; 
    
  #     return min_index; 
    end
  # } 
    min_index
  end 
    
  # // A utility function to print the constructed distance array 
  # void printSolution(int dist[]) 
  # { 
  #     printf("Vertex \t\t Distance from Source\n"); 
  #     for (int i = 0; i < V; i++) 
  #         printf("%d \t\t %d\n", i, dist[i]); 
  # } 
    
  # // Function that implements Dijkstra's single source shortest path algorithm 
  # // for a graph represented using adjacency matrix representation 
  def dijkstra(src)
  # void dijkstra(int graph[V][V], int src) 
  # { 
  #     int dist[V]; // The output array.  dist[i] will hold the shortest 
  #     // distance from src to i 
    distances = Array.new(@graph.length, @int_max)
    
  #     bool sptSet[V]; // sptSet[i] will be true if vertex i is included in shortest 
  #     // path tree or shortest distance from src to i is finalized 
    
  #     // Initialize all distances as INFINITE and stpSet[] as false 
  #     for (int i = 0; i < V; i++) 
  #         dist[i] = INT_MAX, sptSet[i] = false; 
    shortest_path = Array.new(@graph.length, false)
    
  #     // Distance of source vertex from itself is always 0 
  #     dist[src] = 0; 
    distances[src] = 0
    
  #     // Find shortest path for all vertices 
  
    for i in (0..@graph.length - 2)

  #     for (int count = 0; count < V - 1; count++) { 
  #         // Pick the minimum distance vertex from the set of vertices not 
  #         // yet processed. u is always equal to src in the first iteration. 
  #         int u = minDistance(dist, sptSet); 
      closest = min_distance(distances, shortest_path)
    
  #         // Mark the picked vertex as processed 
  #         sptSet[u] = true; 
      shortest_path[closest] = true
    
      for v in (0..@graph.length-1)
  #         // Update dist value of the adjacent vertices of the picked vertex. 
  #         for (int v = 0; v < V; v++) 
    
  #             // Update dist[v] only if is not in sptSet, there is an edge from 
  #             // u to v, and total weight of path from src to  v through u is 
  #             // smaller than current value of dist[v] 
        if !shortest_path[v] && @graph[closest][v] && distances[closest] != @int_max && (distances[closest] + @graph[closest][v]) < distances[v]
  #             if (!sptSet[v] && graph[u][v] && dist[u] != INT_MAX 
  #                 && dist[u] + graph[u][v] < dist[v]) 
          distances[v] = distances[closest] + @graph[closest][v]
  #                 dist[v] = dist[u] + graph[u][v]; 
  #     } 
        end
      end    
    end
  #     // print the constructed distance array 
  #     printSolution(dist); 
    p distances
  # } 
  end
    

end