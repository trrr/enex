FactoryGirl.define do
  factory :user do
    email    "email@example.com"
    password "foobarqwe"
    password_confirmation "foobarqwe"
  end

  factory :text do
    body "An example of the text"
  end

  factory :exercise do
    name "Articles"
    description "Articles description"
  end

  factory :word do
    body "an"
    exercise
  end
end
