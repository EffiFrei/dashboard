class AssociateCarrierShipperThroughRequests < ActiveRecord::Migration[5.1]
  def change
  	change_table :requests do |t|
  		t.belongs_to :carrier, index: true
  		t.belongs_to :shipper, index: true
  	end
  end
end
