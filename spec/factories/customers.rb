FactoryBot.define do
  factory :customer do
    # 下記の内容は実際に作成するカラム名に合わせて変更してください
    id {1}
    name { '株式会社AAA' }
  end

  factory :customer2, class: Customer do
    id {2}
    name { '株式会社BBB' }
  end

  factory :customer3, class: Customer do
    id {3}
    name { '株式会社CCC' }
  end
end
