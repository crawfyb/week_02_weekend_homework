# frozen_string_literal: true

require('minitest/autorun')
require('minitest/rg')

require_relative('../room.rb')
require_relative('../guests.rb')
require_relative('../song.rb')

class TestRoom < MiniTest::Test
  def setup
    @room1 = Room.new(1, 4, 5, 50)

    @guest1 = Guests.new('John', 24, 45, "woohoo")
    @guest2 = Guests.new('Jarred', 32, 15, "Sweet Jane")
    @guest3 = Guests.new('Juan', 18, 100, "woohoo")
    @guest4 = Guests.new('Kat', 21, 1000, "woohoo")
    @guest5 = Guests.new('Harrison', 26, 20,"woohoo")

    @song1 = Song.new('The Beatles', 'Come together')
    @song2 = Song.new('The Velvet Underground', 'Sweet Jane')
    @song3 = Song.new('David Bowie', 'Changes')
    @song4 = Song.new("The 3 J's", 'Code along with me')
    end

  def test_return_room_number
    assert_equal(1, @room1.room_number)
  end

  def test_number_of_people_in_room
    assert_equal(0, @room1.count_people_in_room)
  end

  def test_add_guests_to_room
    @room1.add_guests_to_room(@guest1)
    assert_equal(1, @room1.count_people_in_room)
  end

  def test_add_song_to_junkebox
    assert_equal(['Come together'], @room1.add_song_to_jukebox(@song1.title))
  end

  def test_return_capacity
    assert_equal(4, @room1.capacity)
  end

  def test_room_at_full_capacity
    @room1.add_guests_to_room(@guest1)
    @room1.add_guests_to_room(@guest2)
    @room1.add_guests_to_room(@guest3)
    @room1.add_guests_to_room(@guest4)
    @room1.add_guests_to_room(@guest5)
    assert_equal(4, @room1.capacity)
  end

  def test_return_entry_fee
    assert_equal(5, @room1.entry_fee)
  end

  def test_return_till
    assert_equal(50, @room1.till)
  end

  # def test_guest_paying_for_room
  #   @guest1.paying_entry_fee(@room1.entry_fee)
  #   assert_equal(40, @guest1.wallet)
  # end
  #
  def test_charge_guest
    @room1.charge_guest(@room1.entry_fee)
    assert_equal(55, @room1.till)
  end

  def test_transaction
    @guest1.paying_entry_fee(@room1.entry_fee)
    @room1.charge_guest(@room1.entry_fee)
    assert_equal(40, @guest1.wallet)
    assert_equal(55, @room1.till)
  end


def test_guests_favourite_song
    @room1.add_guests_to_room(@guest1)
    @room1.add_song_to_jukebox(@song1.title)
    @room1.add_song_to_jukebox(@song2.title)
    @room1.add_song_to_jukebox(@song3.title)
    @room1.add_song_to_jukebox(@song4.title)
    assert_equal("woohoo", @room1.guest1_favourite_song(@guest2.fav_song))
  end





end
