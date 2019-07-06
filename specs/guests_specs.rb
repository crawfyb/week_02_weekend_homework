# frozen_string_literal: true

require('minitest/autorun')
require('minitest/rg')

require_relative('../guests.rb')
require_relative('../room.rb')
require_relative('../song.rb')

class TestGuests < MiniTest::Test
  def setup
    @guest1 = Guests.new("John", 24, 45)
    @guest2 = Guests.new("Jarred", 32, 15, "Sweet Jane")
    @guest3 = Guests.new("Juan", 18, 100)
    @guest4 = Guests.new('Kat', 21, 1000)
    @guest5 = Guests.new('Harrison', 26, 20)

    @room1 = Room.new(1, 4, 5, 50)

  end

  def test_return_name
    assert_equal("John", @guest1.name)
  end

  def test_return_age
    assert_equal(32, @guest2.age)
  end

  def test_return_wallet
    assert_equal(100, @guest3.wallet)
  end

  def test_guest_paying_for_room
    @guest1.paying_entry_fee(@room1)
    assert_equal(40, @guest1.wallet)
  end


end
