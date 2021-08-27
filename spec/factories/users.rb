FactoryBot.define do
  factory :user do
    name                      {"荒川智貴"}
    email                     {'test@com'}
    password                  {'1111'}
    password_confirmation     {"2222ab"}
    nickname                  {'あらちゃん'}
    profile                   {'よろしくお願い致します。'}
    experience_id             {2}
  end
end
