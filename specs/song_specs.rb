# frozen_string_literal: true

require('minitest/autorun')
require('minitest/rg')

require_relative('../song.rb')

class TestSong < MiniTest::Test
  def setup
    @song1 = Song.new('The Beatles', 'Come together')
    @song2 = Song.new('The Velvet Underground', 'Sweet Jane')
    @song3 = Song.new('David Bowie', 'Changes')
    @song4 = Song.new("The 3 J's", 'Code along with me')

    # @songs = [@song1, @song2, @song4, @song4]
  end

  def test_return_song_title
    assert_equal('Changes', @song3.title)
  end
end
