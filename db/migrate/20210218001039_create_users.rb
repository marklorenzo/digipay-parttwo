class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.decimal :user_balance

      t.timestamps
    end
  end
end
