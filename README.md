# Rales Engine

[![Build Status](https://semaphoreci.com/api/v1/adamgunther1/rales_engine/branches/master/shields_badge.svg)](https://semaphoreci.com/adamgunther1/rales_engine)

This project is the first dive we have taken into developing an API. We are manipulating data that we have pulled from CSV files and doing advanced Active Record quieries upon it.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

You will need

```
Rails 5.1.2
Ruby 2.4.1
```

### Installing

A step by step series of examples that tell you have to get a development env running

First make sure you are using the proper version of rails and ruby as stated above. Then run a bundle. This should install all the gems located in the Gemfile that you will need to run Rales Engine

```
bundle install
```

Then you will need to set up the test and database environments

```
rake db:create
rake db:migrate
rake db:test:prepare
```
To import all the CSV files

```
bundle exec rake import
```
That should have you up and running!

## Running the tests

For this project we used Rspec for our testing and made sure that we had adequate coverage with Simplecov.

### To run the entire test suite

just write RSpec in your terminal

```
rspec
```

### To run a specific test

You want to refine each test based upon the file tree. For instance, if you want to run everything within the models test spec you would write:

```
rspec spec/models
```
If you want to refine your search even more, you will add an additional layer to the request

```
rspec spec/models/customer_spec.rb
```

You can refine the search further by adding the line number of the specific test within the file that you would like to run

```
rspec spec/models/customer_spec.rb:4
```

## Built With

* [Rails](http://rubyonrails.org/) - The web framework used
* [Active Record](http://guides.rubyonrails.org/active_record_basics.html) - Database Queries


## Authors

* **Sarah Kirk** [LinkedIn](https://www.linkedin.com/in/sarahelizabethkirk/), [Github](https://github.com/sarahdactyl71)

* **Ben Ross** [LinkedIn](https://www.linkedin.com/in/benjamin-james-ross/), [Github](https://github.com/Benja-Ross)


## Acknowledgments

* Turing School of Software and Design
* Stack Overflow Community
