# README

to do :

add page & form to add/create family members
add method to remove family relationship and link to that on person show page, and route

add page to add/edit neighborhoods
add method to remove neighborhood association and link to that on person show page (a link that is really a form, i think)

permissions -- views look like
<% if can? :update, @article %>
  <%= link_to "Edit", edit_article_path(@article) %>
<% end %>

  or
<% if cannot? :update, @article %>
  Editing disabled.
<% end %>


set up routes

set up views:
  show neighborhood, borough, family
  add
  edit

change name of app (not just 19th century)

This README would normally document whatever steps are necessary to get the
application up and running.

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
