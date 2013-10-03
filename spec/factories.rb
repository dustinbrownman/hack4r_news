FactoryGirl.define do 

  factory :user do 
    email "user@user.com"
    password "foobar"
    password_confirmation { |u| u.password }
  end

  factory :post do 
    url "http://example.com"
    title "Example Title"
  end

  factory :comment do 
    content "Example comment"
  end

end