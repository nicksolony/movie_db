# README

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


Models:

User
  username:string
  password:digest
  email:string

Genre
  name:string

Review
  user:belongs_to
  movie:belongs_to
  comment:text
  rating:integer

Person
  name:string
  dob:date

Movie
  title:string
  genre:belongs_to
  director:belongs_to
  writer:belongs_to
  release_date:date

Character
  movie:belongs_to
  person:belongs_to
  name:string
