require "minitest/autorun"
require_relative "../../graph/adjacency_list"

class TestAdjacenyList < Minitest::Test
  def setup
    @list = AdjacencyList.new
    @list.add_edge(0, 1);
    @list.add_edge(0, 2);
    @list.add_edge(1, 2);
    @list.add_edge(2, 0);
    @list.add_edge(2, 3);
    @list.add_edge(3, 3);
  end

  def test_add_edge
    @list.print_graph
  end

  def test_breadth_first_search
    assert_equal [2,0,3,1], @list.breath_first_search(2)
  end
end