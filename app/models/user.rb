#Created by adding file to models folder
#hit rails console to try out CRUD actions
#User.all/user.create(username: "name", email: "email.com")
#find user with user.find
#change user email with user.email
#user.save then User.all
#to destroy call User.first then user.destroy
class User < ApplicationRecord
    #method below keeps and saves emails as downcase
    before_save {self.email = email.downcase}
    has_many :articles
    validates :username, presence: true, 
                        uniqueness: { case_sensitive: false }, 
                        length: { minimum: 3, maximum: 25 }
    #checks email format w/ regular expressions(regex)
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, 
                        uniqueness: { case_sensitive: false },  
                        length: { maximum: 105 },
                        format: { with: VALID_EMAIL_REGEX }
    has_secure_password


end