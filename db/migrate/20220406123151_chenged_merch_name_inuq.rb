class ChengedMerchNameInuq < ActiveRecord::Migration[6.1]
  def change
    change_column :merchants, :name, :string, unique: true, null: false
    add_index  :merchants, :name
  end
end
