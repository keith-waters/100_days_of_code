require "minitest/autorun"
require_relative "../../trie/trie"

class TestTrie < Minitest::Test
  def setup
    @trie = Trie.new
    @keys = ["the", "a", "there", "answer", "any", "by", "bye", "their" ]
  end

  def test_trie
      @trie.insert('the')
      p @trie.root
  end

  def test_search
      @trie.insert('the')
      @trie.insert('then')
      @trie.insert('abba')
      @trie.insert('borgenburger')
      assert_equal true, @trie.search('the')
      assert_equal true, @trie.search('then')
      assert_equal true, @trie.search('borgenburger')
  end
end