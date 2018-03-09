class Restaurant < ApplicationRecord
  has_many :user_restaurants
  has_many :users, through: :user_restaurants

  def self.search(query)
    if query
      Restaurant.where('restaurants.NAME LIKE ?', "%#{query}%")
    else
      self.all
    end
  end

  def address_to_google_string
    converted = self.address.split(" ").join("+").gsub(".", "")
  end

  def name_to_open_table_string
    converted = self.name.split(" ").join("-").gsub("'", "").downcase
  end

  def date
    t=Time.now
    t.strftime "%Y-%m-%d"
  end

  def self.location_sort
    location_hash = {}
    Restaurant.all.each do |restaurant|
      if location_hash[restaurant.location] != nil
        location_hash[restaurant.location] << restaurant.name
      else
        location_hash[restaurant.location] = [restaurant.name]
      end
    end
    location_hash.sort
  end

end
