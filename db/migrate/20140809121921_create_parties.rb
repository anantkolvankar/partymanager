class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.references :user, index: true
      t.string     :title
      t.string     :description
      t.date       :party_date
      t.string     :location
      t.integer    :user_id

      t.timestamps
    end
  end
end
