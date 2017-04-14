class Employee < ApplicationRecord
  scope :emp_name_number, -> (emp) {where("name ILIKE ? or number ILIKE ?", "%#{emp}%", "%#{emp}%")if emp.present?}
  scope :emp_department, -> (department_id) {where("department_id = ?", department_id) if department_id.present?}

  belongs_to :department

end
