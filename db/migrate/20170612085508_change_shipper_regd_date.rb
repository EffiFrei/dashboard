class ChangeShipperRegdDate < ActiveRecord::Migration[5.1]
  def change
    change_table :shippers do |t|
    	t.change :reg_date, :timestamp
    end
  end
end
