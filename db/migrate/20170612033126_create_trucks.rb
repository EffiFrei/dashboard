class CreateTrucks < ActiveRecord::Migration[5.1]
  def change
    create_table :trucks do |t|
      t.string :registration_num
      t.string :engine_num
      t.string :chasis_num
      t.string :manufacturer
      t.string :model
      t.integer :load_capacity
      t.integer :load_height
      t.integer :load_width
      t.integer :load_base_length
      t.string :registration_auth
      t.string :fitness
      t.date :purchase_date
      t.string :insurer
      t.string :policy_num
      t.date :insurance_expiry
      t.date :permit_expiry
      t.integer :gross_vehicle_weight
      t.integer :unloaded_weight
      t.string :body_type
      t.string :current_location
      t.string :current_status
      t.belongs_to :request, index: true
      t.belongs_to :carrier, index: true

      t.timestamps
    end
  end
end
