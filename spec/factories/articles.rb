# создание статьи
FactoryGirl.define do
  factory :article do
    title "simple title"
    text "bu bu bu bu bu"

    # создание статьи с комментарием
    factory :article_with_comments do
      after :create do |article, evaluator|
        create_list :comment, 3, article: article
      end
    end
  end
end