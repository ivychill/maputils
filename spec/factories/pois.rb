# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :poi do
    ref "MyString"
    ref_type "MyString"
    X "MyString"
    Y "MyString"
  end
end
