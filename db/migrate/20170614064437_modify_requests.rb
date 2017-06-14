class ModifyRequests < ActiveRecord::Migration[5.1]
  def change
  	change_table :requests do |t|
  		t.change :phone_src, :string
  		t.change :phone_dest, :string
  	end
  end
end
