# Write a function rotate(ar[], d, n) that rotates arr[] of size n by d elements.
#     [1,2,3,4,5,6,7]
# Rotation of the above array by 2 will make array
#     [3,4,5,6,7,1,2]

class Rotations

  def temp_array(arr, d)
    temp = []

    temp = arr.shift(d)

    arr.concat(temp)
  end
end