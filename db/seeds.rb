user1 = User.new(:name => 'admin', :email => 'admin@admin.com', :password => '00000000',
                :admin => 'true')
user1.save!

user2 = User.new(:name => 'test1', :email => 'test1@test1.com', :password => '11111111',)
user2.save!

user3 = User.new(:name => 'test2', :email => 'test2@test2.com', :password => '22222222',)
user3.save!

user4 = User.new(:name => 'test3', :email => 'test3@test3.com', :password => '33333333',)
user4.save!


Product.create!(
  [
    {
      name: 'ゴールド',
      unit_price: '2000',
      stock: '10',
    },
    {
      name: 'ドライポンプ',
      unit_price: '3000',
      stock: '50',
    },
    {
      name: 'ターボ分子ポンプ',
      unit_price: '4000',
      stock: '30',
    },
    {
      name: '油回転真空ポンプ',
      unit_price: '5000',
      stock: '40',
    },
    {
      name: '電離真空系',
      unit_price: '1500',
      stock: '400',
    },
    {
      name: 'ピラニ真空系',
      unit_price: '1000',
      stock: '450',
    },
    {
      name: '蒸着装置',
      unit_price: '300000',
      stock: '3',
    },
    {
      name: 'スパッタ装置',
      unit_price: '500000',
      stock: '4',
    }
  ]
)

Estimate.create!(
  [
    {
      name: 'ゴールド',
      unit_price: '2000',
      stock: '10',
    },
    {
      name: 'ドライポンプ',
      unit_price: '3000',
      stock: '50',
    },
    {
      name: 'ターボ分子ポンプ',
      unit_price: '4000',
      stock: '30',
    },
    {
      name: '油回転真空ポンプ',
      unit_price: '5000',
      stock: '40',
    },
    {
      name: '電離真空系',
      unit_price: '1500',
      stock: '400',
    },
    {
      name: 'ピラニ真空系',
      unit_price: '1000',
      stock: '450',
    },
    {
      name: '蒸着装置',
      unit_price: '300000',
      stock: '3',
    },
    {
      name: 'スパッタ装置',
      unit_price: '500000',
      stock: '4',
    }
  ]
)
