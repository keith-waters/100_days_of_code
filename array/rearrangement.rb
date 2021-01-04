#
#

class Rearrangement
  def naive(arr)
    len = arr.length
    range = (0..len-1)
    temp = -1
    for i in range 
      for j in range
        if arr[j] == i
          temp = arr[i]
          arr[i] = arr[j]
          arr[j] = temp
          break
        end
      end
    end
    for x in range
      arr[x] = -1 unless arr[x] == x
    end
    arr
  end

  def check_and_replace(arr)
    len = arr.length
    range = (0..len-1)

    for i in range
      temp = arr[i] #1
      next if temp == -1 || temp == i

      while arr[temp] != -1 && arr[temp] != temp
        temp2 = arr[temp] #2
        arr[temp] = temp #1
        temp = temp2 #2
      end

      arr[temp] = temp
      arr[i] = -1 if arr[i] != i
    end
    arr
  end

  def hash_set(arr)
    hash = {}
    len = arr.length
    range = (0..len-1)

    for i in range
      hash[arr[i]] = true
    end

    for i in range
      if hash[i]
        arr[i] = i 
      else
        arr[i] = -1
      end
    end
    arr
  end

  def swap_elements(arr)
    len = arr.length
    index = 0

    while index < len
      if arr[index] != -1 && arr[index] != index
        temp = arr[arr[index]]
        arr[arr[index]] = arr[index]
        arr[index] = temp
        next
      end
      index+=1
    end
    arr
  end

  def reverse_iterative(arr)
    start = 0
    ending = arr.length-1

    while start < ending
      temp = arr[ending]
      arr[ending] = arr[start]
      arr[start] = temp
      start+=1
      ending-=1
    end
    arr
  end

  def r_recursive(arr, start, ending)
    return if start >= ending

    temp = arr[start]
    arr[start] = arr[ending]
    arr[ending] = temp

    
    r_recursive(arr, start+1, ending-1) 
    arr
  end

  def reverse_recursive(arr)
    start = 0
    ending = arr.length-1
    r_recursive(arr, start, ending)
  end

  # elements at even positions are greater than ALL elements before it and elements at odd positions are less than all elements before it
  def odds_and_evens(arr)
    len = arr.length
    arr_copy = []
    range = (0..len-1)
    even = len/2
    odd = len-even

    for i in range
      arr_copy[i] = arr[i].dup
    end
    
    arr_copy.sort!
    j = odd-1
    for i in (0..len-1).step(2)
      p arr_copy[j]
      arr[i] = arr_copy[j]
      j-=1
    end

    j = odd
    for i in (1..len-1).step(2)
      p arr_copy[j]
      arr[i] = arr_copy[j]
      j+=1
    end
    
    arr
  end
end