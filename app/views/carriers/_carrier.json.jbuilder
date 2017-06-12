json.extract! carrier, :id, :name, :PoC, :address, :phone, :email, :reg_date, :owner_name, :org_type, :PAN, :ST_num, :incorporation_date, :CIN, :created_at, :updated_at
json.url carrier_url(carrier, format: :json)
