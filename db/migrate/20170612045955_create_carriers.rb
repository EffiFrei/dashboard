class CreateCarriers < ActiveRecord::Migration[5.1]
  def change
    create_table :carriers do |t|
      t.string :name
      t.string :PoC
      t.text :address
      t.string :phone
      t.string :email
      t.string :owner_name
      t.string :org_type
      t.string :PAN
      t.string :ST_num
      t.date :reg_date
      t.string :CIN

      t.timestamps
    end
  end
end
