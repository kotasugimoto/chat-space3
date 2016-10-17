# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation
 -members
  -group_id :references
  -user_id :references
 -groups
  -group_name :string
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
