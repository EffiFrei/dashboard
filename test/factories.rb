FactoryGirl.define do
  sequence(:email) { |n| "mail-#{n}@example.com" }
  sequence(:name) { |n| "user-#{n}" }

  factory :admin do
    name
    email
    phone '9876543210'
    address 'Jamshedpur'
    password '123456'
    password_confirmation '123456'
  end

  factory :carrier do
  	name
  	owner_name 'John Doe'
  	PoC 'Bob'
    address 'Jamshedpur'
    phone '9876543210'
    PAN 'ABCDE1234F'
    CIN 'U12345AB6789CDE012345'
    email
    password '123456'
    password_confirmation '123456'
  end

  factory :shipper do
    name
    poc 'Bob'
    address 'Jamshedpur'
    phone '9876543210'
    PAN 'ABCDE1234F'
    CIN 'U12345AB6789CDE012345'
    email
    password '123456'
    password_confirmation '123456'
  end
  
  factory :truck do
    carrier
    registration_num '43245345'
    engine_num '345435'
    chasis_num '423423'
    manufacturer 'example'
    model 'example'
    load_capacity 10
  end

  factory :driver do
    name
    DL 'AB0123456789012'
    phone '9876543210'
    address 'Jamshedpur'
    email
    password '123456'
    password_confirmation '123456'
    truck
  end
  
  factory :request do
    carrier
    shipper
  	source 'Tomorrowland'
  	destination 'Gotham'
  	poc_src 'John Doe'
    phone_src '9876543210'
    poc_dest 'John Doe'
    phone_dest '9876543210'
  end
end