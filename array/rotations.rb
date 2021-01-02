# Write a function rotate(ar[], d, n) that rotates arr[] of size n by d elements.
#     [1,2,3,4,5,6,7]
# Rotation of the above array by 2 will make array
#     [3,4,5,6,7,1,2]

class Rotations
  def temp_array(arr, d)
    temp = arr.shift(d)
    arr.concat(temp)
  end

  def left_rotate(arr, d)
    i = 0
    while i < d
      temp = arr[0]
      arr.each_with_index do |item, index|
        # Ruby wraps array indexes
        arr[index-1] = item if index > 0
      end
      arr[arr.length-1] = temp
      i += 1
    end
    arr
  end

  def gcd(x, y)
    return x if y == 0
    gcd(y, x%y)
  end

  def juggling(arr, d)
    gcd = gcd(arr.length, d)
    p gcd
    i = 0
    while i < gcd
      temp = arr[0]
      j = i
      while 1
        k = j + d

        k = k-arr.length if k >= arr.length

        break if k == i

        arr[j] = arr[k]

        j = k
      end

      arr[j] = temp
      i += 1
    end
    arr
  end
end