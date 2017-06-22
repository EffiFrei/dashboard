class AssociateTruckDriver < ActiveRecord::Migration[5.1]
  def change
  	change_table :drivers do |t|
  		t.belongs_to :trucks, index: true
  	end
  end
end
