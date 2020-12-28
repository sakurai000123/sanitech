class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, null: false, limit: 255
      t.string :password_digest, null: false, limit: 255
      t.string :in_charge_no, null: false, limit: 255

      t.timestamps
      t.index :in_charge_no, unique: true
    end
  end
end
