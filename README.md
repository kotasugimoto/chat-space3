# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation
 -users
  -name :string PRIMARY KEY
  -mail :string PRIMARY KEY
  -pass :string PRIMARY KEY
 -groups
  -group_name :string
  -user_id :integer
 -messages
  -body :text
  -image :string
  -group_id :integer
  -user_id :integer
* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
