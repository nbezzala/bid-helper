class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.date :signup_date
      t.date :last_access

      t.timestamps
    end
  end
end
