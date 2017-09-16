# README

to do :

validations for models (do later)

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
  index of neighborhoods and boroughs
  index of families (find people who don't have parents)
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
