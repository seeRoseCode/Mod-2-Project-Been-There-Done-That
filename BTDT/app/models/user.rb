class User < ApplicationRecord
    has_many :visits
    has_many :countries, through :visits
    has_many :posts
    has_many :comments

    def self.all
        @@users = User.all
    end

    def most_points
        @@users.max_by { |user| user.points }
    end

    def avg_visits_per_user
        User.all.average(:visits)
    end

    def age_range
    end
end
