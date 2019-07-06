class Guests

  attr_reader :name, :age, :fav_song
  attr_accessor :wallet

  def initialize(name, age, wallet, fav_song)
    @name = name
    @age = age
    @wallet = wallet
    @fav_song = fav_song
    @gust_talking = []
  end


  def paying_entry_fee(price)
    @wallet -= price
  end



end
