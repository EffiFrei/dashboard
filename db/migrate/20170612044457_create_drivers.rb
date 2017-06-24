class CreateDrivers < ActiveRecord::Migration[5.1]
  def change
    create_table :drivers do |t|
      t.string :DL
      t.date :DL_issue_date
      t.string :name
      t.string :phone
      t.text :address
      t.date :DOB
      t.string :blood_group
      t.date :DL_expiry
      t.belongs_to :truck, index: true
      
      t.timestamps
    end
  end
end
