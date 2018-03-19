# Borrow Book App

## About

App was created just to measure possible productivity achieved within 24 hours

## Tech Stack

* Ruby 2.5.0
* PostgreSQL 9.2
* Server: Heroku

## Installation

### Setting up the development environment

1. Get the code. Clone this git repository and check out the latest release:
```
git clone git@github.com:charliestarkpl/borrowing_books.git
cd borrowing_books
git checkout latest
```

2. Setup database with example data:
```
rake db:create db:migrate db:seed
```

3. Copy environment variables:
```
cp .env-sample env
```

## Usage
### Run application
```
$ rails s
```

### What's worth looking into?

Despite not styling a View layer, there is some code worth checking.

What was done:
- Heroku config
- Sidekiq config
- Authentication by Google Api
- Basic Service Objects
- Basic RSpec specs
- Scopes
- Polymorphic Associations
