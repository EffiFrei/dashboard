class ModifyDrivers < ActiveRecord::Migration[5.1]
  def change
  	change_table :drivers do |t|
			t.string :phone
			t.rename :adress, :address
  	end
  end
end
