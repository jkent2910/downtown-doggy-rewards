FactoryGirl.define do
  sequence :email do |n|
    "admin#{n}@dmdoggy.com"
  end
  
  factory :admin do |a|
    a.email
    a.password 'password'
    a.password_confirmation 'password'
  end

  factory :carrie, :parent => :admin do |c|
    c.email 'carrie@dmdoggy.com'
  end

end
