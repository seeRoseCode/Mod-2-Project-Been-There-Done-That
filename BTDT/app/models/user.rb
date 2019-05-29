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
      if @num_of_visits == 5
        self.points += 10
      elsif @num_of_visits == 10
        self.points += 50
      elsif @num_of_visits == 15
        self.points +=  100
      end
    end


    # def age_range
    # end
end
