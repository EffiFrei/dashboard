class CreateShippers < ActiveRecord::Migration[5.1]
  def change
    create_table :shippers do |t|
      t.string :name
      t.string :address
      t.string :poc
      t.string :email
      t.string :phone
      t.string :org_type
      t.string :PAN
      t.string :ST_num
      t.string :CIN
      t.date :reg_date

      t.timestamps
    end
  end
end
