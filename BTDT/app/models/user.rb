class User < ApplicationRecord
    has_secure_password ######BUG########
    has_many :visits
    has_many :countries, through: :visits
    has_many :posts
    has_many :comments


    def most_points
        User.all.max_by { |user| user.points }
    end

    def avg_visits_per_user
        User.all.average(:visits)
    end


    def bonus_points
      @num_of_visits = self.visits.length
      if @num_of_visits > 15
        self.points += 100
      elsif @num_of_visits > 10
        self.points += 50
      elsif @num_of_visits > 5
        self.points +=  10
      end
    end

    def num_of_countries
      self.countries.uniq.length
    end

####################LEADER BOARD METHODS###########################
    def self.sort_by_points#WORKING
      all.sort_by {|u| u.points}.reverse
    end

    def self.sort_by_countries#WORKING
      User.all.sort_by{|u| u.countries.uniq.length}.reverse
    end

    def self.sort_by_visits#WORKING
      User.all.sort_by{|u| u.visits.length}.reverse
    end

    def my_rank_by_countries
      rank = User.sort_by_countries.index {|u| u.name == self.name}.index + 1
      rank
    end

    def my_rank_by_points
      rank = User.sort_by_points.index {|u| u.name == self.name}.index + 1
      rank
    end

    def my_rank_by_visits
      rank = User.sort_by_visits.index {|u| u.name == self.name}.index + 1
      rank
    end

    def title
      #based on num of countries visited
      num = self.num_of_countries
      if num > 50
        "World Traveler"
      elsif num > 21
        "Professional Tourist. 'I Live Abroad'"
      elsif num > 11
        "Frequent Flyer. 'Look at You'"
      elsif num > 5
        "Above Average. 'Out and About!''"
      elsif num > 3
        "Average 'Eh. Nothing Special'"
      else
        "Couch Potato 'You need to get out more'"
      end
    end

    # def age_range
    # end
end
