class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.integer :num_trucks
      t.string :source
      t.string :destination
      t.string :poc_src
      t.string :poc_dest
      t.integer :phone_src
      t.integer :phone_dest
      t.string :email_src
      t.string :email_dest
      t.timestamp :reqd_date
      t.string :service_lvl

      t.timestamps
    end
  end
end
