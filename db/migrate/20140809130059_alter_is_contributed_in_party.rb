class AlterIsContributedInParty < ActiveRecord::Migration
  def change
    change_column :parties, :is_contributed, :boolean, :default => false
  end
end
