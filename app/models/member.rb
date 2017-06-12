class Member < ApplicationRecord
  validates :name, presence: true
  has_many :departments
end
