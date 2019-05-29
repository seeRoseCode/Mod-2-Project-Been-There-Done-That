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

    def my_points
      @points = self.points
      @visits = self.visits
      @num_of_visits = self.visits.length

      @visits.each do |v|
        @points += 10
      end

      case @num_of_visits
      when 1..5
        @points += 10
      when 6..10
        @points += 50
      when 11..15
        @points +=  100
      end

      @points
    end

    # def age_range
    # end
end
