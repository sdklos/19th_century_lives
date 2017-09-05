# README

This app will have:

a boroughs table : name(string), comments(text)
a neighborhoods table : name(string), borough_id, comments(text)
a persons table : name, year of birth, year of death comments(text)
a persons_neighborhoods join table person_id place_id
a children_parents self join table, person_id, parent_id, child_id,

a person has_many :children_parents, class_name: 'ChildParent', foreign_key: :person_id
a person has_many :parents, through: :children_parents, class_name: 'Person', foreign_key: :child_id
a person has_many :children, through: :children_parents, class_name: 'Person', foreign_key: :parent_id

a person has_many :persons_places

a ChildParent belongs_to :parent, class_name: 'Person', foreign_key: :parent_id
a relationship belongs_to :child, class_name: 'Person', foreign_key: :child_id
a relationship belongs_to :person, class_name: 'Person', foreign_key: :person_id


persons instance methods:
siblings
grandparents
aunts_and_uncles
nephews_and_nieces
cousins

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
