#
#

class Rearrangement
  def naive(arr)
    len = arr.length
    i = 0
    j = 0
    temp = 0
    while i < len
      while j < len
        if arr[j] == i
          temp = arr[j]
          arr[j] = arr[i]
          arr[i] = temp
          break
        end
        j+=1
      end
      j=0
      i+=1
    end

    j = 0
    while j < len
      arr[j] = -1 if arr[j] != j
      j+=1
    end
    arr
  end

  def check_and_replace(arr)
    len = arr.length
    p arr
    arr.each_with_index do |item, index|
      next if item == -1 || item == index

      temp = arr[index]
      while arr[temp] != -1 && arr[temp] != temp
        temp2 = arr[temp]
        arr[temp] = temp
        temp = temp2
      end

      arr[temp] = temp
      arr[index] = -1 if arr[index] != index
    end
    arr
  end
end