class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.integer :num_trucks
      t.string :source
      t.string :destination
      t.string :poc_src
      t.string :poc_dest
      t.string :phone_src
      t.string :phone_dest
      t.string :email_src
      t.string :email_dest
      t.date :reqd_date
      t.string :service_lvl
      t.integer :load_weight
      t.integer :load_height
      t.integer :load_length
      t.integer :load_width
      t.belongs_to :shipper, index: true

      t.timestamps
    end
  end
end
