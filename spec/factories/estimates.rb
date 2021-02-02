FactoryBot.define do
  factory :estimate do
    # 下記の内容は実際に作成するカラム名に合わせて変更してください
    customer_name { '株式会社AAA' }
    deadline { '002022-01-11' }
    discount { '100' }
    product_name {'ゴールド'}
  end

  factory :another_estimate, class: Estimate do
    customer_name { '株式会社BBB' }
    deadline { '002022-02-22' }
    discount { '200' }
    product_name {'ドライポンプ'}
  end

  # trait :with_nested_instances do
  #   after( :create ) do |estimate|
  #     create :estimate_products, estimate_id: estimate.id, product_id:1, product_id:2
  #   end
  # end
end
