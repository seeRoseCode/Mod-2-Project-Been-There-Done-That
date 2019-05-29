class Country < ApplicationRecord
  has_many :visits
  has_many :users, through: :visits

  # 4 methods
  # 1. #all
  # 2. #visits
  # 3. #users
  # 4. #most_visited
  # 5. #least_visited


  # 2 specs
  # 1. Country model created
  # 2. Country.all = []
  # 3. Country.visits = []
  # 4. Country.users = []

  def self.most_visited
    all.sort_by{|country| country.vists.length}.last
  end

  def self.least_visited
    all.sort_by{|country| country.visits.length}.last
  end

  def self.sort_by_visits
    all.sort_by{|c| c.visits.length}.reverse[0..9]
  end


end
