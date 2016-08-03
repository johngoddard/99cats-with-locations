class Cat < ActiveRecord::Base
  COLORS = ["brown", "tabby", "black", "white"]
  SEXES = ["M", "F"]

  validates :birth_date, :color, :sex, :name, :description, :lat, :long, presence: true
  validates :color, inclusion: COLORS
  validates :sex, inclusion: SEXES

  has_many :cat_rental_requests

  def age
     Time.now.year - birth_date.year
  end
end
