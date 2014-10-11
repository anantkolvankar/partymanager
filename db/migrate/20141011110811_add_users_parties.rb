class AddUsersParties < ActiveRecord::Migration
  def change
    create_table :users_parties do |t|
      t.references :user, index: true
      t.references :party, index: true
    end
  end
end
