class Sorting
  def simple(arr, k)
    arr.sort[k-1]
  end

  def kth_smallest_min_heap(arr, k)
    min_heap = MinHeap.new(arr)
    ans = 0
    for i in (0..k-1)
      ans = min_heap.extract_min
    end
    ans
  end

  def kth_smallest_max_heap(arr, k)
    max_heap = MaxHeap.new(arr, k)

    for i in (k..arr.length-1)
      if arr[i] < max_heap.get_max
        max_heap.replace_max(arr[i])
      end
    end
    max_heap.get_max
  end

  def swap(arr,x,y)
    temp = arr[x]
    arr[x] = arr[y]
    arr[y] = temp
    arr
  end

  def partition(arr, left, right)
    x = arr[right]
    i = left
    j = left 

    while j <= right-1
      if arr[j] <= x
        arr = swap(arr, i, j)
        i+=1
      end
      j+=1
    end
    arr = swap(arr, i, right)
    return {:arr => arr, :pos => i}
  end

  def quick_sort(arr, k, left, right)
    if k > 0 && k <= right-left+1
      data = partition(arr, left, right)
      arr = data[:arr]
      pos = data[:pos]

      return arr[pos] if pos-left == k-1
      return quick_sort(arr, k, left, pos-1) if pos-left > k-1
      quick_sort(arr, k-pos+left-1, pos+1, right)
    end
  end

  def kth_smallest_quick_sort(arr, k)
    quick_sort(arr, k, 0, arr.length-1)
  end
end

class MinHeap 
  attr_accessor :heap_arr
  attr_accessor :heap_size

  def initialize(arr)
    @heap_arr = arr
    @heap_size = arr.length

    i = (heap_size-1)/2
    while i >=0
      min_heapify(i)
      i-=1
    end
  end

  def parent(i) (i-1)/2 end

  def left(i) 2*i+1 end

  def right(i) 2*i end

  def get_min() heap_arr[0] end

  def extract_min
    root = heap_arr[0]
    if heap_size > 1
      heap_arr[0] = heap_arr[heap_size-1]
      min_heapify(0) 
    end
    self.heap_size-=1
    root
  end

  def swap(x, y)
    temp = heap_arr[x]
    heap_arr[x] = heap_arr[y]
    heap_arr[y] = temp
  end

  def min_heapify(i)
    left = left(i)
    right = right(i)
    min = i

    min = left if left < heap_size && heap_arr[left] < heap_arr[i]
    min = right if right < heap_size && heap_arr[right] < heap_arr[min]
    if min != i
      swap(min, i)
      min_heapify(min)
    end
  end
end

class MaxHeap
  attr_accessor :heap_arr
  attr_accessor :heap_size

  def initialize(arr, k)
    @heap_arr = arr
    @heap_size = k

    i = (heap_size-1)/2
    while i >= 0
      max_heapify(i)
      i-=1
    end
  end

  def parent(i) (i-1)/2 end
  def left(i) 2*i+1 end 
  def right(i) 2*i+2 end
  def get_max() heap_arr[0] end

  def swap(x,y)
    temp = heap_arr[x]
    heap_arr[x] = heap_arr[y]
    heap_arr[y] = temp
  end

  def replace_max(x)
    heap_arr[0] = x
    max_heapify(0)
  end

  def max_heapify(i)
    left = left(i)
    right = right(i)
    max = i

    max = left if left < heap_size && heap_arr[left] > heap_arr[i]
    max = right if right < heap_size && heap_arr[right] > heap_arr[max]
    if max != i
      swap(max, i)
      max_heapify(max)
    end
  end
end