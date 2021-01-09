# Only one disk can be moved at a time.
# Disk can only be moved if it is the uppermost disk on a stack.
# No disk may be placed on top of a smaller disk.

class TowerOfHanoi
  def get_top(stack)
    stack[stack.length-1]
  end

  def iterative(towers)
    discs = towers[0].length
    total_moves = (2**discs)-1

    source = towers[0]
    aux = towers[1]
    dest = towers[2]

    move_disc = lambda do |source, dest| 
      if source.length == 0
        source.push(dest.pop)
      elsif dest.length == 0
        dest.push(source.pop)
      elsif get_top(source) > get_top(dest)
        source.push(dest.pop)
      else
        dest.push(source.pop)
      end
    end

    i = 1
    while i <= total_moves
      move_disc.call(source, dest) if i%3 == 1
      move_disc.call(source, aux) if i%3 == 2 
      move_disc.call(aux, dest) if i%3 == 0
      i+=1
    end
 
    [source, aux, dest]
  end
end