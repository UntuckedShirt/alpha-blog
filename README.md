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
