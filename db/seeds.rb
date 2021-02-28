user1 = User.find_by(
  name: 'admin'
) || User.create(
  name: 'admin',
  email: 'admin@admin.com',
  password: '00000000',
  admin: true
)

user2 = User.find_by(
  name: 'test2'
) || User.create(
  name: 'test2',
  email: 'test2@test2.com',
  password: '22222222',
  admin: false
)

user3 = User.find_by(
  name: 'test3'
) || User.create(
  name: 'test3',
  email: 'test3@test3.com',
  password: '33333333',
  admin: false
)

user4 = User.find_by(
  name: 'test4'
) || User.create(
  name: 'test4',
  email: 'test4@test4.com',
  password: '44444444',
  admin: false
)

products = Product.create!(
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

customers = Customer.create!(
  [
    {
      name: '株式会社AAA',
    },
    {
      name: '株式会社BBB',
    },
    {
      name: '株式会社CCC',
    },
    {
      name: '株式会社DDD',
    },
    {
      name: '株式会社EEE',
    },
    {
      name: '株式会社FFF',
    },
    {
      name: '株式会社GGG',
    },
    {
      name: '株式会社LLL',
    }
  ]
)

Estimate.create!(
  [
    {
      customer_id: customers[0].id,
      discount: '0',
      deadline: '2022-01-11',
      user_id: 2,
      estimate_products_attributes: [
        {quantity: '2', product_id: products[0].id},
      ]
    }
  ]
)
estimate2 = Estimate.create!(
  [
    {
      customer_id: customers[1].id,
      discount: '10000',
      deadline: '2022-01-11',
      user_id: 3,
      estimate_products_attributes: [
        {quantity: '2', product_id: products[1].id}
      ]
    }
  ]
)
# Estimate.create!(
#   [
#     {
#       customer_id: customers[2].id,
#       discount: '0',
#       deadline: '2022-01-11',
#       user_id: 4,
#       estimate_products_attributes: [
#         {quantity: '2', product_id: products[2].id},
#       ]
#     }
#   ]
# )
Estimate.create!(
  [
    {
      customer_id: customers[3].id,
      discount: '0',
      deadline: '2022-01-11',
      user_id: 2,
      estimate_products_attributes: [
        {quantity: '2', product_id: products[3].id}
      ]
    }
  ]
)
Estimate.create!(
  [
    {
      customer_id: customers[4].id,
      discount: '0',
      deadline: '2023-01-11',
      user_id: 3,
      estimate_products_attributes: [
        {quantity: '2',  product_id: products[3].id},
        {quantity: '1',  product_id: products[2].id},
      ]
    }
  ]
)
estimate1 = Estimate.create!(
  [
    {
      customer_id: customers[5].id,
      discount: '1000',
      deadline: '2023-01-11',
      user_id: 2,
      estimate_products_attributes: [
        {quantity: '3',  product_id: products[1].id},
        {quantity: '1',  product_id: products[2].id},
        {quantity: '1',  product_id: products[3].id},
      ]
    }
  ]
)
Estimate.create!(
  [
    {
      customer_id: customers[6].id,
      discount: '0',
      deadline: '2023-01-11',
      user_id: 2,
      estimate_products_attributes: [
        {quantity: '1',  product_id: products[3].id},
        {quantity: '1',  product_id: products[4].id},
        {quantity: '1',  product_id: products[5].id},
      ]
    }
  ]
)
estimate3 = Estimate.create!(
  [
    {
      customer_id: customers[6].id,
      discount: '50000',
      deadline: '2023-01-11',
      user_id: 4,
      estimate_products_attributes: [
        {quantity: '1',  product_id: products[7].id},
      ]
    }
  ]
)


reason = Reason.create!(
  user_id: user3.id,
  estimate_id: estimate2.first.id,
  content: '今回限り！！！'
)

reason = Reason.create!(
  user_id: user2.id,
  estimate_id: estimate1.first.id,
  content: '特別値引きしました！！！'
)

reason = Reason.create!(
  user_id: user4.id,
  estimate_id: estimate3.first.id,
  content: 'リピートのため値引き。'
)
