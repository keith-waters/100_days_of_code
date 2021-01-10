# Only one disk can be moved at a time.
# Disk can only be moved if it is the uppermost disk on a stack.
# No disk may be placed on top of a smaller disk.

class TowerOfHanoi
  def get_top(stack)
    stack[stack.length-1]
  end

  def iterative(towers)
    # For an even number of disks:
      # make the legal move between pegs A and B (in either direction),
      # make the legal move between pegs A and C (in either direction),
      # make the legal move between pegs B and C (in either direction),
    # repeat until complete.

    # For an odd number of disks:
      # make the legal move between pegs A and C (in either direction),
      # make the legal move between pegs A and B (in either direction),
      # make the legal move between pegs B and C (in either direction),
    # repeat until complete.
    # In each case, a total of 2**n − 1 moves are made.

    discs = towers[0].length
    source = towers[0]
    aux = towers[1]
    dest = towers[2]
    total_moves = (2**discs)-1

    move_disc = lambda do |source,dest|
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

    for i in (1..total_moves)
      move_disc.call(source, dest) if i%3 == 1
      move_disc.call(source, aux) if i%3 == 2
      move_disc.call(aux, dest) if i%3 == 0
    end

    discs%2 == 0 ? [source, dest, aux] : [source, aux, dest]
  end

  def recursive(n, from_rod, to_rod, aux_rod)
    # def TowerOfHanoi(n , from_rod, to_rod, aux_rod):
    #   if n == 1:
    #       print("Move disk 1 from rod",from_rod,"to rod",to_rod)
    #       return
    #   TowerOfHanoi(n-1, from_rod, aux_rod, to_rod)
    #   print("Move disk",n,"from rod",from_rod,"to rod",to_rod)
    #   TowerOfHanoi(n-1, aux_rod, to_rod, from_rod)

    if n>0
      recursive(n-1, from_rod, aux_rod, to_rod)
      to_rod.push(from_rod.pop)
      recursive(n-1, aux_rod, to_rod, from_rod)
    end
  end

  def call_recursive(towers)
    n = towers[0].length
    recursive(n, towers[0], towers[2], towers[1])
    towers
  end
end