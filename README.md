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
