user = User.new(:name => 'test', :email => 'test@test.com', :password => '11111111')
user = User.new(:name => 'admin', :email => 'admin@admin.com', :password => '00000000',
                :admin => 'true')
user.save!
