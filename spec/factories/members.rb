FactoryGirl.define do
  factory :department, class: Department do
    transient do
      member_name nil
    end

    member do
      create(:member, name: member_name)
    end
  end
  factory :member, class: Member do
    name "from feature file"
  end
end

# FactoryGirl.define do
#   factory :member, class: Member do
#     name "Članica Testna"
#   end
# end

# FactoryGirl.define do
#   factory :member, class: Member do
#     transient do
#       department_name nil
#     end
#
#     department do
#       create(:department, name: department_name)
#     end
#   end
#
#   factory :department, class: Department do
#     name "oddelek dobim iz .feature datoteke"
#   end
# end
