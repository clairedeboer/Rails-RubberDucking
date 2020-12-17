class Duck < ApplicationRecord
  belongs_to :student

  validates :name, uniqueness: true
  validates :description, uniqueness: true
end
