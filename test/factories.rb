FactoryGirl.define do
  factory :admin do
  	name 'John Doe'
    email 'test@example.com'
    address 'Jamshedpur'
    password 'f4k3p455w0rd'
    phone '9876543210'
  end

  factory :carrier do
  	name 'Example'
  	owner_name 'John Doe'
  	PoC 'Bob'
    address 'Jamshedpur'
    phone '9876543210'
    PAN 'ABCDE1234F'
    CIN 'U12345AB6789CDE012345'
    email 'test@example.com'
    password 'f4k3p455w0rd'
  end

  factory :driver do
  	name 'John Doe'
  	DL 'AB0123456789012'
    phone '9876543210'
    address 'Jamshedpur'
    email 'test@example.com'
    password 'f4k3p455w0rd'
  end

  factory :request do
  	source 'Tomorrowland'
  	destination 'Gotham'
  	poc_src 'John Doe'
    phone_src '9876543210'
    email_src 'test@example.com'
    poc_dest 'John Doe'
    phone_dest '9876543210'
    email_dest 'test@example.com'
  end
end