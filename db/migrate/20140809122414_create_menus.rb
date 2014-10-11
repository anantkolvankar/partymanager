class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string  :name
      t.integer :price
      t.integer :menu_id

      t.timestamps
    end
  end
end
