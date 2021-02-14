class CreateDeliveryFeeBurdens < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_fee_burdens do |t|

      t.timestamps
    end
  end
end
