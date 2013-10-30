# Hack4er News (clone)

A simple [Hacker News](https://news.ycombinator.com/news) clone, built in rails as part of
[Epicodus](http://epicodus.com).

My goal was to get more comfortable using rails, especially writing routes. This was also my first
attempt with AJAX. Check out how the comments work to see it in action. I also didn't include all
the RESTful actions (posts and comments cannot be destroyed). This is something I should add in at
some point.

Before running the app, run `bundle install` to install the necessary gems, `rake db:create` to
create your database, and then `rake db:schema:load` to load the database schema (note that the
poltergeist gem requires PhantomJS).

Enjoy!
