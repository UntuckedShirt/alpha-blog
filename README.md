# README



#Task - Production Deploy

Deploy to production using Heroku (optional) - production hosting service

This README would normally document whatever steps are necessary to get the
application up and running.



To create a new article from the browser (front-end), you'll need a form to get input from the user. Since we're dealing with articles which have title and description, you want to give the user an ability to fill-in the title and description of the article they are trying to create. The form is displayed via the new route/action and the form submission is handled by the create action.

EDIT: edit and update
Once the flash helper has the key of 'notice' which has value of 'Article was created successfully' via the create action, you can use this helper in your views (upon the redirect) to display the message to the user. Therefore we add the following code to the app/views/layouts/application.html.erb file within the body tag:

<% flash.each do |name, msg| %> 
  <%= msg %> 
<% end %>


DELETE: Delete articles
Deleting articles can be accomplished using the destroy action in the articles controller. The standard deletion process would look like below:

1. Expose the destroy route.

2. Add the destroy action in the articles controller.

3. Find the article to delete and delete it using the destroy method within the destroy action.


User: interface 
We added a lot of links to the application in order to perform all the actions for articles, along with adding the ability to navigate around the application. These were accomplished using layout links. See html.erbs

DRY - Don't Repeat Yourself - code can be accomplished by refactoring or 'extracting away code redundancies'. We accomplished a significant amount of this by using a couple of private methods in our articles controller and using partials in our views. Clean code should always be a priority once features are built and working as we want so that our code is easy to read and easily maintainable. See htmls and article controllers

Production Deployment -
We used the following steps to deploy our application to production (using Heroku). If you have not set up a Heroku account and deployed the application at the end of section 3 (including all the setup steps like installing Heroku CLI and creating a heroku app), you are encouraged to do so now before moving forward. If you would rather not deploy to production, then you can safely skip this step.

Steps we followed:

- verify Gemfile

- issue the following command in the terminal bundle install --without production

- make a commit of code

-- git add -A

-- git commit -m "helpful message depending on what you are committing to your repo"

To deploy to heroku:

git push heroku master

To push to GitHub repo:

git push origin master

Since we now have a db component to our application with the articles table, we will need to run migrations in production so the production articles table is created. To run migrations at heroku, you can use the following command:

heroku run rails db:migrate

You can preview your production app by issuing the following command from the terminal:

heroku open

or,

You can directly pull up a browser window and paste in the name of your application. It'll take the following format:

https://yourappname.herokuapp.com




Create users - text directions and code
To create a git feature branch, you can use:

$ git checkout -b nameofbranch

To create a feature branch named create-users-table-model:

$ git checkout -b create-users-table-model

To view list of branches:

$ git branch

To move to master branch:

$ git checkout master

To move back to already created feature branch:

$ git checkout create-users-table-model

Important to remember is to always have master branch deployable to production and work on all new features and additions in feature branches

To create a migration to create users table:

$ rails generate migration create_users

Then within the migration file, add in the following code within the create_table block to add the username, email and timestamps columns (created_at and updated_at):

t.string :username
t.string :email
t.timestamps
To run the migration file and create the users table:

$ rails db:migrate

Now create the User model file. Add a user.rb file under app/models folder and fill in the following:

class User < ApplicationRecord
end
Then you can test out the mode using the rails console. You can start the rails console and try out the following commands (or other commands as you choose):

$ rails console
User.all
User
user = User.create(username: "test", email: "test@example.com")
user = User.create(username: "test2", email: "test2@example.com")
# To grab first user and update their email address:
user = User.find(1) 
# OR
user = User.first
# update the email
user.email = "test3@example.com"
user.save
# To destroy user with id of 2 (if that id exists in your users table, or select
# an appropriate id that does exist
user = User.find(2)
user.destroy
To make a commit of the changes made in the feature branch, from the feature branch itself:

$ git add -A
$ git commit -m "create users table and user model"
To merge the changes made in the feature branch to the master branch first switch to master branch:

$ git checkout master
$ git merge create-users-table-model 
# or the name of your feature branch instead of create-users-table-model
To push your master branch to your online repo:

$ git push origin master

If you want to discard/delete a feature branch that is no longer needed and has been merged to master branch already (not covered in video):

$ git branch -d nameofbranch

To delete a feature branch that is no longer needed but has NOT been merged to master (not covered in video):

git branch -D nameofbranch



Add user validations - text directions and code
Validations for User class:

- username must be present and unique, length between 3 and 25 characters

- email must be present and unique, length max of 105 characters

- validate email format using regex (regular expression)

You can find the code added to the user model during the video here: https://github.com/udemyrailscourse/alpha-blog-6/commit/1834571a5a219fb3347f0a3d658a7a8e89607a78

The ruby regular expression used to match the format of valid email addresses is listed below.

/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i


New User Signup - text directions and code
The code changes made in the previous video can be found here: https://github.com/udemyrailscourse/alpha-blog-6/commit/57eb602a0e582d31e6ecc19efbddf3681745a2be

To add the route for the new user signup page and the rest of the restful routes separately, add the following two lines to your routes.rb file:

get 'signup', to: 'users#new'
resources :users, except: [:new]
The changes made in the video in addition to the routes above are listed below (reference the commit for the specific code):

- Create users controller.

- Add new action along with initiating a new user instance variable.

- Create a users folder under app/views and add the new.html.erb template.

- Add a form partial, _form.html.erb, in the same folder.

- Update app/views/shared/_errors.html.erb and replace @article references with obj.

- Update app/views/articles/_form.html.erb and add obj: @article when rendering the errors partial.

Test out the form by going to /signup page and ensure it shows up.


Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# alpha-blog
# alpha-blog
# alpha-blog
