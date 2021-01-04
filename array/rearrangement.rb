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
    arr.each { |item| hash[item] = true }

    arr.each_with_index do |item, index| 
      if hash[index]
        arr[index] = index  
      else
        arr[index] = -1
      end

    end

    arr
  end

  def swap_elements(arr)
    index = 0
    while index < arr.length
      if arr[index] >= 0 && arr[index] != index
        temp = arr[arr[index]]
        arr[arr[index]] = arr[index]
        arr[index] = temp
      else
        # this is why this works!!! the loop
        # does not advance if it does a swap
        index+=1
      end
    end
    arr
  end
end