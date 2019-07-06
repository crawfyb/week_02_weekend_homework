# frozen_string_literal: true

class Room
  attr_reader :room_number, :capacity, :entry_fee
  attr_accessor :till

  def initialize(room_number, capacity, entry_fee, till)
    @room_number = room_number
    @capacity = capacity
    @entry_fee = entry_fee
    @till = till


    @guests_in_room = []
    @jukebox = []
  end

  def count_people_in_room
    @guests_in_room.length
  end

  def add_guests_to_room(guest)
    if capacity > @guests_in_room.length
    @guests_in_room << guest
    end
  end

  def add_song_to_jukebox(song_title)
    @jukebox << song_title
  end

  def charge_guest(entry_fee)
    @till += entry_fee
  end

  def guest1_favourite_song(fav)
    if @jukebox.include?(fav)
      return "woohoo"
    end
  end

end
