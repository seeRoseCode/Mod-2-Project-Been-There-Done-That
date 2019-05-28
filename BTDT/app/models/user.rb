class User < ApplicationRecord
    has_many :visits
    has_many :countries, through :visits
    has_many :posts
    has_many :comments
end
