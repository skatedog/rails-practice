FactoryBot.define do
  factory :task do
    name { 'テストを書く' }
    description { 'テストの書き方を学習する' }
    user
  end
end