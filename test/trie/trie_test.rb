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
    @trie.insert('then')
    @trie.insert('abba')
    @trie.insert('borgenburger')
    assert_equal true, @trie.search('then')
    assert_equal false, @trie.search('the')

    @trie.insert('the')
    assert_equal true, @trie.search('the')
    assert_equal true, @trie.search('borgenburger')
  end

  def test_remove
    @trie.insert('then')
    @trie.insert('abba')
    assert_equal true, @trie.search('then')
    assert_equal true, @trie.search('abba')

    @trie.remove('abba')
    assert_equal false, @trie.search('abba')

    @trie.insert('the')
    assert_equal true, @trie.search('the')
    @trie.remove('the')
    assert_equal false, @trie.search('the')
    assert_equal true, @trie.search('then')
  end

  def test_display
    @trie.insert('the')
    @trie.insert('abba')
    @trie.insert('scorcher')
    assert_equal ['abba','scorcher','the'], @trie.display
  end
end