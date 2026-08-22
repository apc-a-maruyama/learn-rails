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

## Setup

```bash
docker run --rm -v "$(pwd):/app" -w /app ruby:3.4 sh -c "gem install rails && rails new . --api -d sqlite3 --skip-bundle"
```
