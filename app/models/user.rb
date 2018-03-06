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

  def matches
    matches = UserRestaurant.all.select {|user_restaurant| user_restaurant.user_id == self.id}
    matches.uniq{|t| t.restaurant_id }
  end
end
