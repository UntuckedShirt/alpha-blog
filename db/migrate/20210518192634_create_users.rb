#Created by typing rails g migration create_users
#Add username an email to table. Timestamp should be auto generated
class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.timestamps
    end
  end
end
