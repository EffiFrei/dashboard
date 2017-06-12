class CreateDrivers < ActiveRecord::Migration[5.1]
  def change
    create_table :drivers do |t|
      t.string :DL
      t.timestamp :DL_issue_date
      t.string :name
      t.text :adress
      t.timestamp :DOB
      t.string :blood_group
      t.timestamp :DL_expiry

      t.timestamps
    end
  end
end
