FactoryBot.define do
  factory :estimate do
    # 下記の内容は実際に作成するカラム名に合わせて変更してください
    customer_name { '株式会社AAA' }
    deadline { '002022-01-11' }
    discount { '100' }
    product_name {'ゴールド'}

    trait :with_nested_instances do
      after( :create ) do |estimate|
        create :estimate_products, id: estimate.id
      end
    end
  end

  factory :another_estimate, class: Estimate do
    customer_name { '株式会社BBB' }
    deadline { '002022-02-22' }
    discount { '200' }
    product_name {'ドライポンプ'}
    quantity {'1'}
  end
end
