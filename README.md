# Projects Search APIs with Elasticsearch

This a REST APIs application to test Ruby on Rails implementation with Elasticsearch search engine.

##### Prerequisites

The setups steps expect following tools installed on the system.

- Ruby [3.0.3](https://www.ruby-lang.org/en/)
- Rails [6.1](https://rubyonrails.org/)
- PostgreSQL [9.6+](https://www.postgresql.org/)
- Elasticsearch [7.x](https://www.elastic.co/fr/elasticsearch/)

##### 1. Check out the repository

```bash
git clone git@github.com:touredev/projects-search-api.git
```

##### 2. Create .env file from .example.env and set environment variables

Copy the sample .example.env file and edit the system configuration as required.

```bash
cp .example.env .env
```

##### 3. Create and setup the database

Run the following commands to create and setup the database.

```ruby
rails db:create
rails db:setup
```

##### 4. Import data into Elasticsearch

Run the following commands to import the data.

```ruby
rails c
Project.import(force: true)
```

##### 5. Start the Rails server

You can start the rails server using the command given below.

```ruby
rails s
```

##### 6. Test the API

You can test the search endpoint in your browser like in the example below.

```
GET http://localhost:3000//main/search?q=amazon

GET http://localhost:3000//main/search?q=amazon&tech_stack=python
```
