class Recipe < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :chef, presence: true
  validates :ingredients, presence: true

  def ingredients_list
    result = []
    ingredients.split(", ").each do |ingredient|
      result << ingredient.downcase
    end
    result
  end

  def directions_list
    directions.split(", ")
  end

  def friendly_created_at
    created_at.strftime("%B %e, %Y")
  end

  def friendly_prep_time
    return unless prep_time
    hours = prep_time / 60
    minutes = prep_time % 60
    result = ""
    result += "#{hours} hour(s) " if hours > 0
    result += "#{minutes} minute(s)" if minutes > 0
    result
  end
end
