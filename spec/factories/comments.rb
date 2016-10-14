# создание комментария
FactoryGirl.define do
  factory :comment do
    author "Vasia"
    sequence(:body) { |n| "be be be be be - #{n}" }
  end
end