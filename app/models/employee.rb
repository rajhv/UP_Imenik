class Employee < ApplicationRecord

  validates :member, presence: {message: 'je potrebno vnesti!' }
  validates :department, presence: {message: 'je potrebno vnesti!' }
  validates :name, presence: {message: 'je potrebno vnesti!' }
  validates :number, numericality: {only_integer: true, message: 'lahko vsebuje le cifre!' }
  validates :mobile_number, :format => { :with => /\A(\+\d{3,4}\s)?\(?\d{2,3}\)?[\s.-]?\d{3}[\s.-]?\d{3}\z/, message: 'ni pravilnega zapisa!', :allow_blank => true }
  validates :email, :format => { :with => /\b([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\b/, message: 'ni pravilnega zapisa!', :allow_blank => true }

  # if query string is not present all employees are returned
  scope :find_by_name_or_number_or_email, -> (query_string) { query_string.present? ? where("name ILIKE ? or number ILIKE ? or email ILIKE ? or mobile_number ILIKE ?", "%#{query_string}%", "%#{query_string}%", "%#{query_string}%", "%#{query_string}%") : all }
  # if departments is not present all employees are returned
  scope :find_by_departments, -> (departments) { departments.present? ? where(department: departments) : all }

  belongs_to :department
  has_one :member, through: :department
end
