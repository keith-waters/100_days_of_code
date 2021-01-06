class Sorting
  def simple(arr, k)
    arr.sort[k-1]
  end

  def kth_smallest_min_heap(arr, k)
    min_heap = MinHeap.new(arr)

    i = 0
    ans = 0
    while i < k 
      ans = min_heap.extract_min
      i+=1
    end
    ans
  end

  def kth_smallest_max_heap(arr, k)
    max_heap = MaxHeap.new(arr, k)

    # for (int i = k; i < n; i++) 
    #   if (arr[i] < mh.getMax()) 
    #       mh.replaceMax(arr[i]); 

    i = k
    while i < arr.length
      if arr[i] < max_heap.get_max
        max_heap.replace_max(arr[i])
      end
      i+=1
    end

    max_heap.get_max
  end
end

class MinHeap 
  attr_accessor :heap_size
  attr_accessor :heap_arr

  def initialize(arr)
    @heap_size = arr.length
    @heap_arr = arr
    i = (arr.length-1)/2
    while i >= 0
      min_heapify(i)
      i-=1
    end
  end

  def parent(i)
    (i-1)/2
  end

  def left(i)
    2*i+1
  end

  def right(i)
    2*i
  end

  def get_min
    heap_arr[0]
  end

  def extract_min
    return 0 if @heap_size == 0

    root = heap_arr[0] # store mininum value
    if @heap_size > 1
      heap_arr[0] = heap_arr[heap_size-1]
      min_heapify(0)
    end
    @heap_size-=1
    root
  end

  def swap(x,y)
    temp = heap_arr[x]
    heap_arr[x] = heap_arr[y]
    heap_arr[y] = temp
  end

  def min_heapify(i)
    left = left(i)
    right = right(i)
    smallest = i
    if left < heap_size && heap_arr[left] < heap_arr[i]
      smallest = left 
    end
    if right < heap_size && heap_arr[right] < heap_arr[smallest]
      smallest = right 
    end
    if smallest != i
      swap(i, smallest) 
      min_heapify(smallest)
    end
  end
end

class MaxHeap
  attr_accessor :heap_size
  attr_accessor :heap_arr

  def initialize(arr, size)
    @heap_size = size
    @heap_arr = arr

    i = (heap_size-1)/2
    while i>=0
      max_heapify(i)
      i-=1
    end
  end

  def parent(i)
    (i-1)/2
  end
  def left(i)
    2*i+1
  end
  def right(i)
    2*i+2
  end
  def get_max
    heap_arr[0]
  end
  def replace_max(x)
    heap_arr[0] = x
    max_heapify(0)
  end


  def swap(x,y)
    temp = heap_arr[x]
    heap_arr[x] = heap_arr[y]
    heap_arr[y] = temp
  end

  def max_heapify(i)
    left = left(i)
    right = right(i)
    max = i
    max = left if left < heap_size && heap_arr[left] > heap_arr[i]
    max = right if right < heap_size && heap_arr[right] > heap_arr[max]
    if max != i
      swap(i, max)
      max_heapify(max)
    end
  end
end