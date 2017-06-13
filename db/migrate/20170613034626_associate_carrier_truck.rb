class AssociateCarrierTruck < ActiveRecord::Migration[5.1]
  def change
  	change_table :trucks do |t|
  		t.belongs_to :carrier, index: true
  	end
  end
end
