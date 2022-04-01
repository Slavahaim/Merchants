class CreateMerchants < ActiveRecord::Migration[6.1]
  def change
    create_table :merchants do |t|
      t.string :name, null: false
      t.string :city, null: false
      t.string :street, null: false
      t.string :country_code, null: false
      t.jsonb :extra_info, default: '{}'

      t.timestamps
    end
    add_index  :merchants, :extra_info
  end
end
