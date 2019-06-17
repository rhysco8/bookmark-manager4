# Bookmark Manager


## User Stories

```
As a time-pressed user
So that I can quickly go to web sites I regularly visit
I would like to see a list of bookmarks
```

## Domain Model

![Bookmark Manager domain model](https://user-images.githubusercontent.com/23095774/59607355-1edd5400-910b-11e9-8c46-d69e375b14e0.png)


## How to use

### To set up the project

Clone this repository and then run:

```
bundle
```

### To set up the database

Connect to `psql` and create the `bookmark_manager` database:

```
CREATE DATABASE bookmark_manager;
```

To set up the appropriate tables, connect to the database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.

### To run the Bookmark Manager app:

```
rackup -p 3000
```
To view bookmarks, navigate to `localhost:3000/bookmarks`.


### To run tests:

```
rspec
```

### To run linting:

```
rubocop
```