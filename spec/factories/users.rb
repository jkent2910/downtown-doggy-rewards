FactoryGirl.define do

  factory :user do |u|
    u.email
    u.password 'password'
    u.password_confirmation 'password'
  end

end
