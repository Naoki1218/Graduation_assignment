FactoryBot.define do
  factory :product do
    # id {1}
    name {'ゴールド'}
    stock {'10'}
    unit_price {'2000'}
  end

  factory :product2, class: Product do
    # id {2}
    name {'ドライポンプ'}
    stock {'10'}
    unit_price {'3000'}
  end

  factory :product3, class: Product do
    # id {3}
    name {'電離真空系'}
    stock {'10'}
    unit_price {'1500'}
  end
end
