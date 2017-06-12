json.extract! shipper, :id, :name, :address, :poc, :email, :phone, :org_type, :PAN, :ST_num, :CIN, :reg_date, :created_at, :updated_at
json.url shipper_url(shipper, format: :json)
