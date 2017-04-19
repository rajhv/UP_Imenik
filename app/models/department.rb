class Department < ApplicationRecord
  scope :dep_member, -> (member_id) {where("member_id = ?", member_id)if member_id.present?}

  belongs_to :member
  has_many :employees
end
