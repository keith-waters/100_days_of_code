require "minitest/autorun"
require_relative "../../graph/adjacency_matrix"

class TestAdjacenyMatrix < Minitest::Test
  def setup
    @graph = [ 
      [0, 4, 0, 0, 0, 0, 0, 8, 0 ], 
      [4, 0, 8, 0, 0, 0, 0, 11, 0 ], 
      [0, 8, 0, 7, 0, 4, 0, 0, 2 ], 
      [0, 0, 7, 0, 9, 14, 0, 0, 0 ], 
      [0, 0, 0, 9, 0, 10, 0, 0, 0 ], 
      [0, 0, 4, 14, 10, 0, 2, 0, 0 ], 
      [0, 0, 0, 0, 0, 2, 0, 1, 6 ], 
      [8, 11, 0, 0, 0, 0, 1, 0, 7 ], 
      [0, 0, 2, 0, 0, 0, 6, 7, 0 ]
    ]
    @adjacency_matrix = AdjacencyMatrix.new(@graph)
  end

  def test_dijkstra
    assert_equal [0, 4, 12, 19, 21, 11, 9, 8, 14], @adjacency_matrix.dijkstra(0)
  end
end