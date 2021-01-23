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
  
class Graph
  def initialize
    @graph = Hash.new { |hash, key| hash[key] = [] }
  end
  #     def __init__(self, V):
  #         self.V = V
  #         self.graph = defaultdict(list)
  
  #     # Adds an edge to an undirected graph
  def add_edge(source, dest, weight)
  #     def addEdge(self, src, dest, weight):
  
  #         # Add an edge from src to dest.  A new node 
  #         # is added to the adjacency list of src. The 
  #         # node is added at the beginning. The first 
  #         # element of the node has the destination 
  #         # and the second elements has the weight
  #         newNode = [dest, weight]
  #         self.graph[src].insert(0, newNode)
    @graph[source].unshift([dest, weight])
  
  #         # Since graph is undirected, add an edge 
  #         # from dest to src also
  #         newNode = [src, weight]
  #         self.graph[dest].insert(0, newNode)
    @graph[dest].unshift([source, weight])
  end

  def dijkstra(src)
  #     # The main function that calulates distances 
  #     # of shortest paths from src to all vertices. 
  #     # It is a O(ELogV) function
  #     def dijkstra(self, src):
  
  #         V = self.V  # Get the number of vertices in graph
  #         dist = []   # dist values used to pick minimum 
  #                     # weight edge in cut
  
    dist = []
  #         # minHeap represents set E
  #         minHeap = Heap()
    min_heap = Heap.new
  
  #         #  Initialize min heap with all vertices. 
  #         # dist value of all vertices
  #         for v in range(V):
  #             dist.append(sys.maxint)
  #             minHeap.array.append( minHeap.
  #                                 newMinHeapNode(v, dist[v]))
  #             minHeap.pos.append(v)
    really_big_num = Float::INFINITY
    for v in (0..@graph.size-1)
      dist.push(really_big_num)
      min_heap.array.push(min_heap.new_node(v, dist[v]))
      min_heap.pos.push(v)
    end
  #         # Make dist value of src vertex as 0 so 
  #         # that it is extracted first
  #         minHeap.pos[src] = src
  #         dist[src] = 0
  #         minHeap.decreaseKey(src, dist[src])
    min_heap.pos[src] = src
    dist[src] = 0
    min_heap.decrease_key(src, dist[src])
  
  #         # Initially size of min heap is equal to V
  #         minHeap.size = V;
    min_heap.size = @graph.size
  
  #         # In the following loop, 
  #         # min heap contains all nodes
  #         # whose shortest distance is not yet finalized.
    while !min_heap.is_empty?
  #         while minHeap.isEmpty() == False:
  
  #             # Extract the vertex 
  #             # with minimum distance value
  #             newHeapNode = minHeap.extractMin()
  #             u = newHeapNode[0]
      print min_heap.inspect
      temp = min_heap.extract_min
      u = temp[0]
  #             # Traverse through all adjacent vertices of 
  #             # u (the extracted vertex) and update their 
  #             # distance values
      for p_crawl in @graph[u]

  #             for pCrawl in self.graph[u]:
  
  #                 v = pCrawl[0]
        v = p_crawl[0]
  
  #                 # If shortest distance to v is not finalized 
  #                 # yet, and distance to v through u is less 
  #                 # than its previously calculated distance
  #                 if minHeap.isInMinHeap(v) and
  #                     dist[u] != sys.maxint and \
  #                   pCrawl[1] + dist[u] < dist[v]:
        if min_heap.is_in_heap?(v) && dist[u] != really_big_num && p_crawl[1]+dist[u] < dist[v]
  #                         dist[v] = pCrawl[1] + dist[u]
          dist[v] = p_crawl[1] + dist[u]
        end
  
  #                         # update distance value 
  #                         # in min heap also
  #                         minHeap.decreaseKey(v, dist[v])
        min_heap.decrease_key(v, dist[v])
      end
    end
  
    print dist
  #         printArr(dist,V)
  end
  
  def print(*args)
    string = ""
    args.each { |arg| string += "#{arg}, "}
    p string
  end
end


class Heap
  attr_accessor :array, :size, :pos
  # class Heap():
 
  #   def __init__(self):
  #       self.array = []
  #       self.size = 0
  #       self.pos = []
  def initialize
    @array = []
    @size = 0
    @pos = []
  end
 
  def print(*args)
    string = ""
    args.each { |arg| string += "#{arg}, "}
    p string
  end
  #   def newMinHeapNode(self, v, dist):
  #       minHeapNode = [v, dist]
  #       return minHeapNode
  def new_node(value, distance)
    [value, distance]
  end
 
  #   # A utility function to swap two nodes 
  #   # of min heap. Needed for min heapify
  #   def swapMinHeapNode(self,a, b):
  #       t = self.array[a]
  #       self.array[a] = self.array[b]
  #       self.array[b] = t
  def swap_node(a, b)
    temp = @array[a]
    @array[a] = @array[b]
    @array[b] = temp
  end
 
  #   # A standard function to heapify at given idx
  #   # This function also updates position of nodes 
  #   # when they are swapped.Position is needed 
  #   # for decreaseKey()
  def min_heapify(index)
  #   def minHeapify(self, idx):
  #       smallest = idx
  #       left = 2*idx + 1
  #       right = 2*idx + 2
    smallest = index
    left = 2*index+1
    right = 2*index+2
 
  #       if left < self.size and
  #          self.array[left][1] \
  #           < self.array[smallest][1]:
  #           smallest = left

  #       if right < self.size and
  #          self.array[right][1]\
  #           < self.array[smallest][1]:
  #           smallest = right
    smallest = left if left < @size && @array[left][1] < @array[smallest][1]
    smallest = right if right < @size && @array[right][1] < @array[smallest][1]
 
    if smallest != index
  #       # The nodes to be swapped in min 
  #       # heap if idx is not smallest
  #       if smallest != idx:
 
  #           # Swap positions
  #           self.pos[ self.array[smallest][0]] 
  #                                      = idx
      @pos[@array[smallest][0]] = index
  #           self.pos[ self.array[idx][0]] =
  #                                    smallest
      @pos[@array[index][0]] = smallest
 
  #           # Swap nodes
  #           self.swapMinHeapNode(smallest, idx)
      swap_node(smallest, index)
 
  #           self.minHeapify(smallest)
      min_heapify(smallest)
    end
  end
 
    # # Standard function to extract minimum 
    # # node from heap
    def extract_min
    # def extractMin(self):
 
    #     # Return NULL wif heap is empty
    #     if self.isEmpty() == True:
    #         return
    return if @array.empty?
 
    #     # Store the root node
    #     root = self.array[0]
    root = @array[0]
 
    #     # Replace root node with last node
    #     lastNode = self.array[self.size - 1]
    #     self.array[0] = lastNode
    last_node = @array[@size-1]
    @array[0] = last_node
 
  #       # Update position of last node
  #       self.pos[lastNode[0]] = 0
  #       self.pos[root[0]] = self.size - 1
      @pos[last_node[0]] = 0
      @pos[root[0]] = @size-1
 
  #       # Reduce heap size and heapify root
  #       self.size -= 1
    @size-=1
    min_heapify(0)
  #       self.minHeapify(0)
 
  #       return root
    root
  end
  #   def isEmpty(self):
  #       return True if self.size == 0 else False
  def is_empty?
    @size == 0
  end
 
  def decrease_key(value, distance)
  #   def decreaseKey(self, v, dist):
  #       # Get the index of v in  heap array
  #       i = self.pos[v]
    index = @pos[value]
  #       # Get the node and update its dist value
  #       self.array[i][1] = dist
    @array[index][1] = distance
  #       # Travel up while the complete tree is 
  #       # not hepified. This is a O(Logn) loop
    parent_index = (index-1)/2
    while index > 0 && @array[index][1] < @array[parent_index][1]
  #       while i > 0 and self.array[i][1] < 
  #                 self.array[(i - 1) / 2][1]:
  #           # Swap this node with its parent
  #           self.pos[ self.array[i][0] ] = (i-1)/2
      @pos[@array[index][0]] = parent_index
  #           self.pos[ self.array[(i-1)/2][0] ] = i
      @pos[@array[parent_index][0]] = index
  #           self.swapMinHeapNode(i, (i - 1)/2 )
      swap_node(index, parent_index)
  #           # move to parent index
  #           i = (i - 1) / 2;
      index = parent_index
    end
  end
 
  #   # A utility function to check if a given 
  #   # vertex 'v' is in min heap or not
  #   def isInMinHeap(self, v):
  def is_in_heap?(value)
    @pos[value] < @size
  #       if self.pos[v] < self.size:
  #           return True
  #       return False
  end
end 