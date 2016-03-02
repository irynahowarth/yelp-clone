class Restaurant < ActiveRecord::Base
  has_many :reviews, dependent: :destroy

  def average_rating
    array=[]
    self.reviews.each do |review|
      array << review.rating
    end
    (array.inject(:+)/(1.0*array.size)).round(2)
  end
end
