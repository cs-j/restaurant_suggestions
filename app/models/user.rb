class User < ApplicationRecord
  has_many :queries
  validates :name, uniqueness: true
end
