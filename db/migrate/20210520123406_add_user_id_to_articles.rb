#to generate id migration for user you must create it using
#rails g migration add_user_id_to_articles

class AddUserIdToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :user_id, :int
  end
end
