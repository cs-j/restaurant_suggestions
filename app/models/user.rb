class User < ApplicationRecord
  has_many :user_restaurants
  has_many :restaurants, through: :user_restaurants
  validates :name, uniqueness: true

  def location_match(location)
    location_matches = Restaurant.all.select {|restaurant| restaurant.location == self.location}
    location_matches.each do |lm|
      UserRestaurant.create(user_id: self.id, restaurant_id: lm.id)
    end
  end

  def keyword_match(keyword)
    keyword_matches = Restaurant.all.select {|restaurant| restaurant.keyword == self.keyword}
    keyword_matches.each do |km|
      UserRestaurant.create(user_id: self.id, restaurant_id: km.id)
    end
  end

  def cuisine_match(cuisine)
    cuisine_matches = Restaurant.all.select {|restaurant| restaurant.cuisine == self.cuisine}
    cuisine_matches.each do |cm|
      UserRestaurant.create(user_id: self.id, restaurant_id: cm.id)
    end
  end

  def matches
    all_matches[0..6]
  end

  def all_matches
    matches = UserRestaurant.all.select {|user_restaurant| user_restaurant.user_id == self.id}
    unique_matches = matches.uniq{|t| t.restaurant_id }
    return_array = []

    unique_matches.each do |user_restaurant|
        if user_restaurant.restaurant.location == self.location && user_restaurant.restaurant.cuisine == self.cuisine && user_restaurant.restaurant.keyword == self.keyword
          return_array << user_restaurant
        elsif user_restaurant.restaurant.location == self.location && user_restaurant.restaurant.cuisine == self.cuisine
          return_array << user_restaurant
        elsif user_restaurant.restaurant.cuisine == self.cuisine && user_restaurant.restaurant.keyword == self.keyword
          return_array << user_restaurant
        elsif user_restaurant.restaurant.location == self.location && user_restaurant.restaurant.keyword == self.keyword
          return_array << user_restaurant
        elsif user_restaurant.restaurant.keyword == self.keyword
          return_array << user_restaurant
        elsif user_restaurant.restaurant.location == self.location
          return_array << user_restaurant
        elsif user_restaurant.restaurant.cuisine == self.cuisine
          return_array << user_restaurant
        end
      end
  end
end
