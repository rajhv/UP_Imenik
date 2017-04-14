class Department < ApplicationRecord
  belongs_to :member
  has_many :employees
end
