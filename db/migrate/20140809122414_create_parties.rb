class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.references :product, index: true
      t.string :extra
      t.boolean :is_contributed
      t.integer :bid
      t.integer :invitee_id

      t.timestamps
    end
  end
end
