class Employee < ApplicationRecord
  # if query string is not present all employees are returned
  scope :find_by_name_or_number_or_email, -> (query_string) { query_string.present? ? where("name ILIKE ? or number ILIKE ? or email ILIKE ?", "%#{query_string}%", "%#{query_string}%", "%#{query_string}%") : all }
  # if departments is not present all employees are returned
  scope :find_by_departments, -> (departments) { departments.present? ? where(department: departments) : all }

  belongs_to :department
  has_one :member, through: :department
end
