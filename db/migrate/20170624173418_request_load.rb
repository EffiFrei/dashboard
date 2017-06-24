class RequestLoad < ActiveRecord::Migration[5.1]
  def change
  	change_table :requests do |t|
  		t.integer :load_weight
  		t.integer :load_height
  		t.integer :load_length
  		t.integer :load_width
  	end
  end
end
