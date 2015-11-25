FactoryGirl.define do

  factory :user do |u|
    sequence :email do |n|
      "user#{n}@gmail.com"
    end
    u.password 'password'
    u.password_confirmation 'password'
  end

end
