This is what I was able to throw together in a couple of nights. I'm
pretty sure I was able to tackle most of the requirements however I wish
I had more time to go through and polish it some more and add more
tests.

###What's Here

A simple app to allow the creation of employees with the capability to log clock in and out of a time tracking
system. Depending on which type of employee they are, they can review a weeks worth of hours worked.

###What's Not Here

Controller Tests: I kept changing the controller actions frequently and on a time constraint didn't have the time to test each action

Integration Tests: Mostly same as above. I know how to write them and have done so frequently at my current position. We use Capybara with Cucumber

Javascript: I'm very familiar in javascript, however, I didn't have time to implement any additional features to showcase my javascript

#### Ruby version

Ruby 2.0.0p353

#### Rails version

Rails 4.0.3

#### Database initialization

The application has some migrations. I had decided to change how some objects functioned midway through
implmentation. Simply run:

```rake db:migrate```

I also added seed data. This should suffice for an SQL dump. To add the employees to your database run:

```rake db:seed```

#### Hosting

You can see a sample of the app running on a free Heroku instance at http://clockinclockout.herokuapp.com/

#### Final notes

I hope this gives you an overview of my skills. I wish I had more time to go over it some more to add more tests, bells and whistles and
prove some other skills I have in web development.

Feel free to check out a site I've been working on for my girlfriend. It's all done in backbone.js

http://www.lilysmithstudio.com/
