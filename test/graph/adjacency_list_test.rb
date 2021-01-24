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

  def test_breadth_first_traversal
    assert_equal [2,0,3,1], @list.breadth_first_traversal(2)
  end

  def test_depth_first_search
    assert_equal [2,0,1,3], @list.depth_first_search(2)
  end

  def test_depth_first_iterative
    list = AdjacencyList.new
    list.add_edge(1, 0);
    list.add_edge(0, 2);
    list.add_edge(2, 1);
    list.add_edge(0, 3);
    list.add_edge(1, 4);
    assert_equal [0,3,2,1,4], list.depth_first_iterative(0)
    assert_equal [2,3,0,1], @list.depth_first_iterative(2)
  end

  def test_dijkstra
    graph = AdjacencyList.new
    graph.add_edge_object(0, 1, 4)
    graph.add_edge_object(0, 7, 8)
    graph.add_edge_object(1, 2, 8)
    graph.add_edge_object(1, 7, 11)
    graph.add_edge_object(2, 3, 7)
    graph.add_edge_object(2, 8, 2)
    graph.add_edge_object(2, 5, 4)
    graph.add_edge_object(3, 4, 9)
    graph.add_edge_object(3, 5, 14)
    graph.add_edge_object(4, 5, 10)
    graph.add_edge_object(5, 6, 2)
    graph.add_edge_object(6, 7, 1)
    graph.add_edge_object(6, 8, 6)
    graph.add_edge_object(7, 8, 7)
    assert_equal [0, 4, 12, 19, 21, 11, 9, 8, 14], graph.dijkstra(0)
  end
end