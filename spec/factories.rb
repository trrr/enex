FactoryGirl.define do
  factory :user do
    email    "email@example.com"
    password "foobarqwe"
    password_confirmation "foobarqwe"
  end

  factory :text do
    sequence(:body) {|n| "An example of the text number #{n} #{('a'..'z').to_a.shuffle[0,8].join}" }
  end

  factory :exercise do
    name "Articles"
    description "Articles description"
    title "Title"
  end

  factory :word do
    body "an"
    exercise
  end

  factory :progress do
    position 1
    exercise_id 1
    user
  end
end
