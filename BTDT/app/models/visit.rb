class Visit < ApplicationRecord
  belongs_to :country
  belongs_to :user

  #
  # 4 methods
  # 1. #all
  # 2. #country
  # 3. #user
  # 4. #most_recent
  # 5. #most_popular (visit with the most likes???)


  def most_recent
    Visit.all.sort_by{|visit| visit.timestamps}.last
  end


end
