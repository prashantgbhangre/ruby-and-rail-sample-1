FactoryGirl.define do
  factory :user do
    name     "Ex User"
    email    "michael@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end