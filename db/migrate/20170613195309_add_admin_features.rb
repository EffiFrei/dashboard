class AddAdminFeatures < ActiveRecord::Migration[5.1]
  def change
  	change_table :admins do |t|
  		t.string :name
  		t.string :phone
  		t.text 	 :address
  	end
  end
end
