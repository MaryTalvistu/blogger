# blogger
A simple blog system to learn the basics of Ruby on Rails including:

- Models, Views, and Controllers (MVC)
- Data Structures & Relationships
- Routing
- Migrations
- Views with forms, partials, and helpers
- RESTful design
- Adding gems for extra features

Check it out [HERE](https://new-blog-test.herokuapp.com/)

# Application / Version Information

Ruby version - 2.6.5

Rails version - 6.0.1

Framework - Ruby on Rails

Database - Postgres

Hosted on Heroku


# Deployment Instructions

Make sure you have Rails and Git installed on your machine

1. git clone the repo to your local machine `git clone https://github.com/MaryTalvistu/blogger`

2. Run `bundle install` to install gems

3. Run `rake db:migrate` to migrate the database

4. On root path you can run `rails s` to begin server

5. Open browser to `localhost:3000` to view application

# Testing

Once you have the repo on your local machine

1. Run `rake db:migrate RAILS_ENV=test` to migrate the testing enviroment database

2. Run `rake test` to verify everything is ok