# Write a function rotate(ar[], d, n) that rotates arr[] of size n by d elements.
#     [1,2,3,4,5,6,7]
# Rotation of the above array by 2 will make array
#     [3,4,5,6,7,1,2]

class Rotations
  def temp_array(arr, d)
    # Using some built-in array methods
    # temp = arr.shift(d)
    # arr.concat(temp)

    #No built-ins!
    temp = []
    for i in (0..d-1)
      temp.push(arr[i])
    end
    arr.each_with_index do |item, index|
      arr[index-d] = item if index >= d
    end
    temp.each_with_index do |item, index|
      arr[index+arr.length-d] = item
    end
    arr
  end

  def rotate_once(arr)
    temp = arr[0]
    arr.each_with_index{ |item, index| arr[index-1] = item if index > 0 }
    arr[arr.length-1] = temp
    arr
  end

  def one_by_one(arr, d)
    # i = 0
    # while i < d
    #   temp = arr[0]
    #   arr.each_with_index do |item, index|
    #     # Ruby wraps array indexes
    #     arr[index-1] = item if index > 0
    #   end
    #   arr[arr.length-1] = temp
    #   i += 1
    # end
    # arr

    i = 0
    while i < d 
      rotate_once(arr)
      i += 1
    end
    arr
  end

  def gcd(x, y)
    return x if y == 0
    gcd(y, x%y)
  end

  def juggling(arr, d)
    len = arr.length
    gcd = gcd(len, d)
    i = 0
    while i < gcd
      temp = arr[0]
      j = i
      while true 
        k = j+d
        k = k-len if k >= len
        break if k==i
        arr[j] = arr[k]
        j = k
      end
      arr[j] = temp
      i+=1
    end
    arr
  end

  def reverse_array(arr, start, ending)
    while start < ending
      temp = arr[start]
      arr[start] = arr[ending]
      arr[ending] = temp
      start+=1
      ending-=1
    end
    arr
  end

  def reversal(arr, d)
    len = arr.length-1
    #reverse the parts then reverse the whole array
    # reverse_array(arr, 0, d-1)
    # reverse_array(arr, d, arr.length-1)
    # reverse_array(arr, 0, arr.length-1)

    # revers the whole array then reverse the parts
    reverse_array(arr, 0, len)
    reverse_array(arr, 0, len-d)
    reverse_array(arr, len-d+1, len)
  end

  def swap(arr, start, ending, d)
    i = 0
    while i < d 
      temp = arr[start + i]
      arr[start + i] = arr[ending + i]
      arr[ending + i] = temp
      i += 1
    end
    arr
  end

  def block_swap_recurse(arr, i, d, len)
    return arr if len == d || d == 0
    return swap(arr, i, len-d+i, d) if len-d == d
    if d < len-d 
      swap(arr, i, len-d+i, d)
      block_swap_recurse(arr, i, d, len-d)
    else
      swap(arr, i, d, len-d)
      block_swap_recurse(arr, len-d+i, 2*d-len, d)
    end
  end
end